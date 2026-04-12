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

### Cursor

Copy `.cursor/rules/jpi-guard.mdc` to your project's `.cursor/rules/` directory.

### Claude Code

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
