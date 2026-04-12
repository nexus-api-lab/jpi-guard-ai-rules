# jpi-guard-ai-rules

AI coding assistants (Cursor, Claude Code, GitHub Copilot) automatically protect your RAG pipelines from prompt injection.

[![jpi-guard](https://img.shields.io/badge/jpi--guard-RAG%20Security-blue)](https://jpi-guard.nexus-api-lab.workers.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## What this does

Copy these rules to your project and every AI assistant will automatically add jpi-guard security checks when writing RAG code.

## Setup

### One-liner (all tools)
```bash
npx pijack init
```
This copies all rules to your project automatically.

### Cursor
```bash
cp -r .cursor/rules/ /your-project/.cursor/rules/
```

### Claude Code
```bash
cat CLAUDE.md >> /your-project/CLAUDE.md
```

### GitHub Copilot
```bash
cp .github/copilot-instructions.md /your-project/.github/
```

## Why?

- Prompt injection is the #1 security risk for RAG applications
- Japanese LLM apps are especially vulnerable (zenkaku bypass, keigo disguise)
- Prompt Security was acquired by SentinelOne for $250M — SME/indie devs have no alternative
- jpi-guard: ¥3,900/mo, Cloudflare Edge, zero logs, Japanese-specialized

## Links
- API: https://jpi-guard.nexus-api-lab.workers.dev/
- npm: https://www.npmjs.com/package/pijack
- PyPI: https://pypi.org/project/jpi-guard/
