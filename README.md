# RepuSw - Claude Code Plugin Marketplace

Organization plugin marketplace for Claude Code. Includes internal tools and curated external plugins.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **repusw** | Internal development workflow tools (code review, status checks, agents) |
| **superpowers** | Agentic skills framework - TDD, brainstorming, debugging, subagent development |

## Installation

### Step 1: Add the marketplace

```bash
/plugin marketplace add RepuSw/RepuSw-plugin
```

### Step 2: Install plugins

```bash
# Install the internal RepuSw plugin
/plugin install repusw@rpsw-marketplace

# Install superpowers
/plugin install superpowers@rpsw-marketplace
```

### Step 3: Verify

Run `/help` to see installed skills, or try:

```bash
/repusw:repusw-hello
/repusw:repusw-code-review
/repusw:repusw-status
```

## Included MCP Servers

The repusw plugin bundles the following MCP servers, which are automatically registered on install:

| MCP Server | Description |
|------------|-------------|
| **context7** | Fetch up-to-date documentation for libraries, frameworks, and APIs |
| **github** | GitHub operations (issues, PRs, repos, code search) |

### Prerequisites

The **github** MCP server requires a GitHub Personal Access Token. Set it as an environment variable before launching Claude Code:

```bash
export GITHUB_PERSONAL_ACCESS_TOKEN=ghp_your_token_here
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
