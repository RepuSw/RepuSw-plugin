# RepuSw - Claude Code Plugin Marketplace

Organization plugin marketplace for Claude Code. Includes internal tools and curated external plugins.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **repusw** | Internal development workflow tools (code review, status checks, agents) |
| **superpowers** | Agentic skills framework - TDD, brainstorming, debugging, subagent development |
| **context7-plugin** | Up-to-date documentation lookup from source repositories |

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

# Install context7
/plugin install context7-plugin@rpsw-marketplace
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

| MCP Server | Source | Description |
|------------|--------|-------------|
| **github** | [github/github-mcp-server](https://github.com/github/github-mcp-server) (Remote HTTP) | GitHub operations (issues, PRs, repos, code search) |
| **context7** | via [upstash/context7](https://github.com/upstash/context7) marketplace plugin | Up-to-date documentation for libraries, frameworks, and APIs |

### Setup

The **github** MCP server requires a GitHub Personal Access Token. You will be prompted to enter it when installing the repusw plugin. You can create one at https://github.com/settings/personal-access-tokens/new

## Recommended LSP Plugins

For code intelligence (diagnostics, go-to-definition, find references), install these LSP plugins from the **official Anthropic marketplace**:

| Plugin | Language | Prerequisites | Install Language Server |
|--------|----------|---------------|------------------------|
| `csharp-lsp` | C# (.cs) | .NET SDK 6.0+ | `dotnet tool install --global csharp-ls` |
| `typescript-lsp` | TypeScript/JavaScript (.ts, .tsx, .js, .jsx) | Node.js | `npm install -g typescript-language-server typescript` |
| `gopls-lsp` | Go (.go) | Go toolchain | `go install golang.org/x/tools/gopls@latest` |
| `swift-lsp` | Swift (.swift) | Swift toolchain (Xcode on macOS) | Bundled with Swift — no extra install needed |
| `kotlin-lsp` | Kotlin (.kt, .kts) | Java 17+ | `brew install JetBrains/utils/kotlin-lsp` |

Install via `/plugin` Discover tab, or:

```bash
/plugin install csharp-lsp
/plugin install typescript-lsp
/plugin install gopls-lsp
/plugin install swift-lsp
/plugin install kotlin-lsp
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
