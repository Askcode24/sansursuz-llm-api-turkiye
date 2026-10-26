#!/usr/bin/env bash
# Türkiye için sansürsüz LLM API — OpenAI uyumlu — quickstart
set -euo pipefail
: "${UNLLM_KEY:?export UNLLM_KEY=sk-...}"

curl -s https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Kripto piyasa değerinin nasıl hesaplandığını kısa ve net anlat."}]}' | head -c 2000
echo
