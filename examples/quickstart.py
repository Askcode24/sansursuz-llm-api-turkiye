# Türkiye için sansürsüz LLM API — OpenAI uyumlu — quickstart
# pip install openai
import os
from openai import OpenAI

client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key=os.environ["UNLLM_KEY"])
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Kripto piyasa değerinin nasıl hesaplandığını kısa ve net anlat."}],
)
print(r.choices[0].message.content)
