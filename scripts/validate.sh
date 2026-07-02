#!/usr/bin/env bash
# scripts/validate.sh — Post-deploy validation for akurai-mail-api
set -euo pipefail

DOMAIN="mail.olibuijr.com"
PORT=3000
RED='\033[0;31m'; GRN='\033[0;32m'; NC='\033[0m'
pass=0; fail=0
pass_() { printf "  ${GRN}PASS${NC} %s\n" "$*"; ((pass++)); }
fail_() { printf "  ${RED}FAIL${NC} %s\n" "$*"; ((fail++)); }

echo "=== Post-deploy validation: akurai-mail-api ==="

# 1. Systemd
systemctl is-active --quiet akurai-mail-ui.service 2>/dev/null && pass_ "systemd active" || fail_ "systemd not active"

# 2. Loopback
if curl -fsS --max-time 5 "http://127.0.0.1:${PORT}/" > /dev/null 2>&1; then
  pass_ "loopback serves"
else
  fail_ "loopback unreachable"
fi

# 3. Public HTTPS
if curl -fsS --max-time 10 "https://${DOMAIN}/" > /dev/null 2>&1; then
  pass_ "public HTTPS serves"
else
  fail_ "public HTTPS unreachable"
fi

# 4. OIDC auth redirect
LOGIN_STATUS=$(curl -sS -o /dev/null -w '%{http_code}' --max-time 10 "https://${DOMAIN}/auth/oidc/callback" 2>/dev/null)
# /auth/oidc/callback should be reachable (returns app page or redirect, not 404)
[ "$LOGIN_STATUS" != "404" ] && pass_ "/auth/oidc/callback reachable (${LOGIN_STATUS})" || fail_ "/auth/oidc/callback → 404"

# 5. Env file
[ -f "/etc/akurai-mail-ui.env" ] && pass_ "env file present" || fail_ "env file missing"

echo "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GRN}Pass: $pass${NC}  ${RED}Fail: $fail${NC}"
[ "$fail" -eq 0 ] || exit 1
