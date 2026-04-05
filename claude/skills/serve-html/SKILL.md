---
name: serve-html
description: Spin up an HTTP server to serve HTML files for browser viewing via exe.dev proxy. Use when the user needs to view HTML mockups, workshop artifacts, or any static files in the browser.
---

# Serve HTML Files

Starts a lightweight HTTP server in a Zellij pane and reports the browser-accessible URL via the exe.dev proxy.

## When to Use

- After generating workshop HTML artifacts (from `/discover --workshop`, `/arch --workshop`, etc.)
- When the user asks to view HTML files in the browser
- When any workflow produces viewable HTML output

## How to Serve

### 1. Determine the directory to serve

Use the directory containing the HTML files. Common locations:
- Workshop scratchpad: `{scratchpad}/workshop/`
- A specific directory the user provides
- Current working directory as fallback

### 2. Pick a port

Default: `8090`. If already in use, increment until an available port is found.

Check with:
```bash
lsof -i :<port> 2>/dev/null
```

### 3. Start the server in a Zellij utilities tab

First, ensure a "utilities" tab exists and navigate to it:

```bash
zellij action go-to-tab-name "utilities" --create
```

Then start the server as a pane in that tab:

```bash
PANE_ID=$(zellij action new-pane --name "http-server" -- bun -e "Bun.serve({ port: PORT, fetch(req) { const url = new URL(req.url); const path = url.pathname === '/' ? '/index.html' : url.pathname; const file = Bun.file('DIRECTORY' + path); return file.exists().then(e => e ? new Response(file) : new Response('Not found', {status:404})); } }); console.log('Serving DIRECTORY on http://0.0.0.0:PORT')")
```

Then return to the original tab so the user's workflow isn't interrupted:

```bash
zellij action go-to-tab-name "main" # or whatever tab was active before
```

Replace `PORT` and `DIRECTORY` with actual values.

### 4. Report the URL

Determine the VM hostname:
```bash
hostname
```

The external URL follows the exe.dev proxy pattern:
```
https://<hostname>.exe.xyz:<port>/
```

Report to the user:
```
HTTP server running. View at: https://<hostname>.exe.xyz:<port>/
```

If serving a directory with multiple HTML files, list them:
```
Available files:
- https://<hostname>.exe.xyz:<port>/landscape-scan.html
- https://<hostname>.exe.xyz:<port>/opportunity-tree.html
```

### 5. Stop the server

To stop, close the Zellij pane:
```bash
zellij action close-pane --pane-id $PANE_ID
```

Or send Ctrl+C:
```bash
zellij action send-keys --pane-id $PANE_ID "Ctrl c"
```

## Integration with Workshop Commands

When workshop commands produce HTML artifacts, instead of telling the user to `open {scratchpad}/workshop/file.html`, serve the directory and provide the proxy URL. The user can then view the files from any browser.

## Notes

- exe.dev proxies ports 3000-9999 via `https://<vm>.exe.xyz:<port>/`
- Bun is the preferred server (`/home/exedev/.local/share/mise/installs/bun/`)
- Python3 fallback: `python3 -m http.server <port> --directory <dir>`
- Run the server in a Zellij "utilities" tab to keep it out of the main workspace
- Name the pane `http-server` for easy identification
- Check for existing `http-server` panes before starting a new one to avoid duplicates
- Always return to the previous tab after starting the server
