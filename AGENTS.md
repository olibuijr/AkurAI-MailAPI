# AGENTS.md
> 2026-07-07: akurai-notes MCP is deprecated — do not use it (unreliable under write load, and superseded per user instruction). Documentation for this repo now lives in **BUNAGENT notes**, not akurai-notes.

Documentation for this repo lives in **BUNAGENT notes** (`notes_search`/`notes_read` via the `bunagent` MCP, or the Notes app at `http://192.168.1.166:15000/apps/notes.html`).

- Canonical note: `akurai-mail-api — Docs` (folder `AkurAI/Mail`)
- Related UI note: `AkurAI-Mail — Docs` (folder `AkurAI/Mail`)
- Retrieve: `notes_search("akurai-mail-api")`

Runtime secrets live in `/etc/akurai-mail-ui.env` on the EC2 host and in the
**akurai-passvault** MCP, never in this repo. A snapshot of the non-mail-specific
akurai-passvault entries (CRM/VPN OIDC, golfkort, Brevo SMTP) was mirrored into
BUNAGENT passwords (`work` vault) 2026-07-07 for convenience — see the
`AkurAI-PassVault — Migration` BUNAGENT note; akurai-passvault stays authoritative,
this is a one-time copy, not a live sync.

> `CLAUDE.md` intentionally contains only `@AGENTS.md`.
