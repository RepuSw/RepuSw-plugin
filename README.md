# RPSW - Claude Code Plugin Marketplace

Organization plugin marketplace for Claude Code. Includes internal tools and curated external plugins.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **rpsw** | Internal development workflow tools (code review, status checks, agents) |
| **superpowers** | Agentic skills framework - TDD, brainstorming, debugging, subagent development |

## Installation

### Step 1: Add the marketplace

```bash
/plugin marketplace add RepuSw/RepuSw-plugin
```

### Step 2: Install plugins

```bash
# Install the internal RPSW plugin
/plugin install rpsw@rpsw-marketplace

# Install superpowers
/plugin install superpowers@rpsw-marketplace
```

### Step 3: Verify

Run `/help` to see installed skills, or try:

```bash
/rpsw:hello
/rpsw:code-review
/rpsw:status
```

## For Developers

### Local testing

```bash
claude --plugin-dir ./
```

### Reload after changes

```
/reload-plugins
```

## Adding More External Plugins

Edit `.claude-plugin/marketplace.json` and add entries to the `plugins` array:

```json
{
  "name": "plugin-name",
  "source": {
    "source": "github",
    "repo": "owner/repo"
  },
  "description": "What the plugin does"
}
```

Supported sources: relative path (`"."`), GitHub (`github`), Git URL (`url`), Git subdirectory (`git-subdir`), npm (`npm`).
