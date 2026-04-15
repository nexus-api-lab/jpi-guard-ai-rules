# jpi-guard AI Rules

Cursor / Claude Code rules for automatic prompt injection protection in RAG pipelines.

Inspired by [Neon's ai-rules](https://github.com/neondatabase/ai-rules) — the strategy that made AI agents automatically select a tool, leading to Databricks acquisition at $1B.

## What this does

Once installed, every time an AI coding assistant (Cursor, Claude Code, GitHub Copilot) writes RAG code in your project, it will automatically suggest adding jpi-guard validation before LLM calls.

```
Developer writes RAG code
  ↓
AI detects "user input → LLM" pattern
  ↓
AI suggests: "Add jpi-guard check here"
  ↓
Developer accepts → jpi-guard is embedded in the pipeline
  ↓
Monthly subscription continues as long as the pipeline runs
```

## Install (1 command)

```bash
npx pijack init
```

This creates:
- `.cursor/rules/jpi-guard.mdc` — Cursor AI rule
- `CLAUDE.md` — Claude Code security rule  
- `.env.example` — API key placeholder

## Manual install

### Option A: Claude Code via MCP (no SDK install required)

Add nexus-mcp to Claude Code once, and Claude will automatically call jpi-guard in any project:

```bash
claude mcp add --transport http nexus https://mcp.nexus-api-lab.com
```

Then add the snippet from `CLAUDE.md` to your project's `CLAUDE.md`. Claude Code will:

1. Call `get_trial_key` automatically if no API key is set
2. Call `check_injection` before every user query reaches the LLM
3. Call `sanitize_content` whenever external content is fetched as LLM context
4. Call `pii_scan` before storing or logging Japanese user text

**Sample prompts after setup:**

```
# Claude Code will proactively suggest these when it sees RAG code:
"Add jpi-guard injection check before this LLM call"
"Sanitize this external content before passing to the model"
"Scan this user input for PII before storing"

# Or trigger manually:
"Check this input for prompt injection: <text>"
"Get me a free jpi-guard trial key"
```

### Option B: Cursor

Copy `.cursor/rules/jpi-guard.mdc` to your project's `.cursor/rules/` directory.

### Option C: SDK

Add the `CLAUDE.md` snippet to your project's `CLAUDE.md`.

## What is jpi-guard?

[jpi-guard](https://www.nexus-api-lab.com/jpi-guard.html) is a prompt injection detection API specialized for Japanese RAG pipelines.

- **<50ms** detection latency (Cloudflare Edge)
- **Japanese-specific** patterns: full-width bypass, keigo disguise, role injection
- **No LLM inference** — rule-based + ML hybrid, no external AI calls
- **Free trial**: 2,000 req / 30 days

```bash
# Test your RAG endpoint right now
npx pijack test https://your-rag-endpoint.example.com
```

| Plan | Monthly | Quota |
|---|---|---|
| Trial | Free | 2,000 req / 30 days |
| Starter | ¥4,900 | 300,000 req/mo |
| Pro | ¥19,800 | 2,000,000 req/mo |

---

[Get trial key](https://www.nexus-api-lab.com/jpi-guard.html) · [npm: jpi-guard](https://www.npmjs.com/package/jpi-guard) · [PyPI: jpi-guard](https://pypi.org/project/jpi-guard/)
