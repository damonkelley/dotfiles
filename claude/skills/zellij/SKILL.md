---
name: zellij
description: Control Zellij terminal multiplexer - run commands in panes, read output, manage layouts. Use when the user asks to run something in a separate pane, monitor processes, create workspace layouts, or orchestrate multi-pane workflows.
---

# Zellij Terminal Multiplexer Control

You are inside a Zellij session. Use `zellij action` commands to control panes, tabs, and layouts programmatically.

**Current session:** `$ZELLIJ_SESSION_NAME` | **Current pane:** `$ZELLIJ_PANE_ID`

## Core Capabilities

### 1. Run a command in a new pane

```bash
# Tiled pane (returns pane ID like "terminal_5")
PANE_ID=$(zellij action new-pane --name "descriptive-name" -- <command> <args>)

# Floating pane
PANE_ID=$(zellij action new-pane --floating --name "name" -- <command>)

# Floating with specific size/position
PANE_ID=$(zellij action new-pane --floating --width 80% --height 60% --x 10% --y 20% --name "name" -- <command>)

# Run and block until it finishes (synchronous)
zellij action new-pane --close-on-exit --block-until-exit -- <command>
# Exit code is reflected in the zellij command's exit code with --block-until-exit-success / --block-until-exit-failure

# In-place (replaces current pane temporarily)
PANE_ID=$(zellij action new-pane --in-place --name "name" -- <command>)

# Stacked pane
PANE_ID=$(zellij action new-pane --stacked --name "name" -- <command>)

# With working directory
PANE_ID=$(zellij action new-pane --cwd /path/to/dir --name "name" -- <command>)
```

**Important:** Always capture the pane ID when you need to interact with the pane later. The `--` before the command is required.

### 2. Read pane output

```bash
# Current viewport of a pane
zellij action dump-screen --pane-id terminal_5

# Full scrollback
zellij action dump-screen --pane-id terminal_5 --full

# Save to file
zellij action dump-screen --pane-id terminal_5 --full --path /tmp/output.txt
```

### 3. Send input to a pane

```bash
# Paste text (preferred - fast, handles multi-line)
zellij action paste --pane-id terminal_5 "echo hello world"

# Then press Enter to execute
zellij action send-keys --pane-id terminal_5 "Enter"

# Send special keys: Ctrl c, Ctrl d, Ctrl z, Escape, Tab, Up, Down, etc.
zellij action send-keys --pane-id terminal_5 "Ctrl c"

# Write characters (character-by-character, slower)
zellij action write-chars --pane-id terminal_5 "some text"
```

### 4. Query session state

```bash
# List all panes as JSON (includes: id, title, command, cwd, exited, exit_status, geometry, tab info)
zellij action list-panes --json

# List with all fields in table format
zellij action list-panes --all

# List tabs as JSON
zellij action list-tabs --json

# Current tab info
zellij action current-tab-info --json

# Dump current layout as KDL
zellij action dump-layout
```

### 5. Manage panes

```bash
# Close a pane
zellij action close-pane --pane-id terminal_5

# Rename a pane
zellij action rename-pane --pane-id terminal_5 "New Name"

# Toggle fullscreen
zellij action toggle-fullscreen --pane-id terminal_5

# Focus a pane direction
zellij action move-focus right  # left|right|up|down

# Toggle floating/embedded
zellij action toggle-pane-embed-or-floating --pane-id terminal_5

# Reposition a floating pane
zellij action change-floating-pane-coordinates --pane-id terminal_5 --x 10% --y 10% --width 80% --height 80%

# Pin a floating pane (always on top)
zellij action toggle-pane-pinned --pane-id terminal_5

# Show/hide all floating panes
zellij action toggle-floating-panes
zellij action show-floating-panes
zellij action hide-floating-panes

# Set pane colors
zellij action set-pane-color --pane-id terminal_5 --fg "#00ff00" --bg "#001a00"
zellij action set-pane-color --pane-id terminal_5 --reset

# Make borderless
zellij action set-pane-borderless --pane-id terminal_5 --borderless true
```

### 6. Tab management

```bash
# New tab
zellij action new-tab --name "Tab Name"

# New tab with layout
zellij action new-tab --layout /path/to/layout.kdl --name "Tab Name"

# Go to tab
zellij action go-to-tab-name "Tab Name" --create  # --create makes it if missing

# Close tab
zellij action close-tab
zellij action close-tab-by-id 5

# Rename tab
zellij action rename-tab "New Name"
```

### 7. Layout management

```bash
# Override current tab layout
zellij action override-layout /path/to/layout.kdl

# Keep existing terminal panes, only restructure
zellij action override-layout /path/to/layout.kdl --retain-existing-terminal-panes

# Cycle swap layouts
zellij action next-swap-layout
zellij action previous-swap-layout
```

### 8. Subscribe to pane output (real-time streaming)

```bash
# Stream pane updates as JSON (blocks until pane closes)
zellij subscribe --pane-id terminal_5 --format json

# Subscribe to multiple panes
zellij subscribe --pane-id terminal_5 --pane-id terminal_6 --format json

# Include scrollback in initial delivery
zellij subscribe --pane-id terminal_5 --format json --scrollback 100
```

JSON events: `{"event":"pane_update","pane_id":"terminal_5","viewport":[...lines...],"is_initial":true}` and `{"event":"pane_closed","pane_id":"terminal_5"}`

### 9. Sessions

```bash
# List sessions
zellij list-sessions

# Create a background (headless) session
zellij attach --create-background my-session

# Target actions at another session
zellij --session other-session action list-panes --json

# Rename current session
zellij action rename-session "new-name"
```

## Patterns & Recipes

### Run a command and capture its output
```bash
PANE_ID=$(zellij action new-pane --close-on-exit --name "build" -- make build)
# Wait for it to finish
zellij action new-pane --block-until-exit --close-on-exit -- make build
echo "Exit code: $?"
```

### Run a long-running process and poll its output
```bash
PANE_ID=$(zellij action new-pane --name "server" -- npm start)
sleep 2
zellij action dump-screen --pane-id $PANE_ID --full
```

### Check if a pane's command has exited
```bash
zellij action list-panes --json | jq ".[] | select(.pane_id == \"terminal_5\") | .exited"
```

### Create a monitoring overlay
```bash
zellij action new-pane --floating --pinned true --borderless true \
  --width 30% --height 1 --x 70% --y 0 \
  --name "status" -- watch -n1 'echo "CPU: $(uptime | grep -oP "load average: \K[^,]+")"'
```

### Send Ctrl+C to stop a process
```bash
zellij action send-keys --pane-id terminal_5 "Ctrl c"
```

### Parallel command execution
```bash
P1=$(zellij action new-pane --name "tests" -- cargo test)
P2=$(zellij action new-pane --name "lint" -- cargo clippy)
P3=$(zellij action new-pane --name "build" -- cargo build)
# Later: read each pane's output
zellij action dump-screen --pane-id $P1 --full
zellij action dump-screen --pane-id $P2 --full
zellij action dump-screen --pane-id $P3 --full
```

## Guidelines

- **Always name panes** with `--name` for clarity
- **Capture pane IDs** when you'll need to interact with the pane later
- **Use `--close-on-exit`** for one-shot commands to avoid leaving dead panes
- **Use `--block-until-exit`** when you need to wait for a command to finish before proceeding
- **Use `--floating`** for temporary/auxiliary tasks to avoid disrupting the layout
- **Use `dump-screen --full`** to get complete output including scrollback
- **Prefer `paste` over `write-chars`** for sending text - it's faster and handles multi-line
- **Don't send input to the user's current pane** (pane $ZELLIJ_PANE_ID) - create new panes instead
- **Check `list-panes --json`** to discover existing panes before creating duplicates
