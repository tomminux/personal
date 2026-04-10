# Rimuovi credenziali salvate
rm -f ~/.claude/.credentials.json

export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://host.containers.internal:11434
cd "/home/ubuntu/code-workspace" && claude --model gemma4:latest

