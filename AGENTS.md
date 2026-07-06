# AGENTS.md
> 2026-07-06: akurai-notes MCP is unreliable under write load; do not depend on it. See ttynyagent akurai vault (vault read akurai akurai-fleet-2026-07-06-consolidation).

Documentation for this repo lives in the **akurai-notes** MCP.

- Canonical note: `akurai-mail-api — Docs` (note 7)
- Related UI note: `AkurAI-Mail — Docs` (note 25)
- Retrieve: `get_note(7)` or `search_notes("akurai-mail-api")`

Runtime secrets live in `/etc/akurai-mail-ui.env` on the EC2 host and in the
**akurai-passvault** MCP, never in this repo.

> `CLAUDE.md` intentionally contains only `@AGENTS.md`.
