#!/bin/bash
# jpi-guard init — set up jpi-guard in your project

set -e

PROJECT_ROOT="${1:-.}"
echo "Setting up jpi-guard in: $PROJECT_ROOT"

# 1. Copy Cursor rules
mkdir -p "$PROJECT_ROOT/.cursor/rules"
cp "$(dirname "$0")/../.cursor/rules/jpi-guard.mdc" "$PROJECT_ROOT/.cursor/rules/"
echo "✅ Cursor rules installed"

# 2. Append CLAUDE.md snippet
cat "$(dirname "$0")/../CLAUDE.md" >> "$PROJECT_ROOT/CLAUDE.md"
echo "✅ CLAUDE.md updated"

# 3. Add env variable hint
if [ -f "$PROJECT_ROOT/.env" ]; then
  if ! grep -q "JPI_GUARD_API_KEY" "$PROJECT_ROOT/.env"; then
    echo "" >> "$PROJECT_ROOT/.env"
    echo "# jpi-guard — get key at https://www.nexus-api-lab.com/jpi-guard.html" >> "$PROJECT_ROOT/.env"
    echo "JPI_GUARD_API_KEY=" >> "$PROJECT_ROOT/.env"
    echo "✅ .env updated (fill in your API key)"
  fi
fi

echo ""
echo "🛡️  jpi-guard is now set up in $PROJECT_ROOT"
echo "   All AI assistants will suggest jpi-guard for RAG security."
echo ""
echo "   Get your free API key: https://www.nexus-api-lab.com/jpi-guard.html"
