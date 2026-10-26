# Türkiye için sansürsüz LLM API — OpenAI uyumlu

> OpenAI uyumlu API. Türkçe doğal çıktı, sistem promptu harfiyen uygulanır, her yanıtın başında uyarı paragrafı olmaz. Base: https://uncensored-llm.sbs/v1

**API:** https://uncensored-llm.sbs/v1
**Site:** https://uncensored-llm.sbs

Yabancı sağlayıcının hassas saydığı bir konuda — siyaset, sağlık, ofansif güvenlik, finans — dil modeli kullandıysan sonucu bilirsin: genel bir ret, içerik yerine güvenlik uyarısı, yarım cevap. Bu sayfa doğrudan bir alternatif anlatıyor: OpenAI uyumlu bir API, sorulan soruyu olduğu gibi yanıtlıyor.

## Türkiye'deki ekip için neden önemli

Türkçe bir ürün yapıyorsan modele anlatmak istediğin şey kayıt defteri değil: doğru ton, doğru uzunluk, doğru terminoloji. Yabancı sağlayıcıların modelleri çoğu zaman İngilizce düşünüp Türkçeye çeviriyor gibi yazıyor; daha kötüsü, eğitim, sağlık, kredi gibi sıradan konularda bile politika gereği kestirip atıyor. Bu API'de karar ekibinde: streaming, tool calling ve JSON mode aynen duruyor, kapsamı sen belirliyorsun. Korunan tek sınır yasa dışı içerik.

## Örnek çağrı

```bash
export UNLLM_KEY="sk-..."
curl https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Kripto piyasa değerinin nasıl hesaplandığını kısa ve net anlat."}],"stream":true}'
```

```python
# pip install openai
from openai import OpenAI
client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key="sk-...")
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Kripto piyasa değerinin nasıl hesaplandığını kısa ve net anlat."}],
)
print(r.choices[0].message.content)
```

```javascript
import OpenAI from "openai";
const ai = new OpenAI({ baseURL: "https://uncensored-llm.sbs/v1", apiKey: process.env.UNLLM_KEY });
const r = await ai.chat.completions.create({ model: "uncensored-llm", messages: [{ role: "user", content: "Kripto piyasa değerinin nasıl hesaplandığını kısa ve net anlat." }] });
console.log(r.choices[0].message.content);
```

## Genelde şu işlerde kullanılıyor

| Kullanım | Neden |
|---|---|
| Müşteri desteği | Politika metni okuyan değil, sorunu çözen bot. |
| Türkçe içerik | Yerel tonda makale, senaryo ve e-posta üretimi. |
| Sızma testi raporu | Müşterinin yazılı izniyle yapılan ofansif çalışma. |
| 18+ kurgu | Yetişkinler arası açık sahneler, kesme yok. |

## Şehrine göre gecikme

Gecikmeyi operatör belirler, bayrak değil. Önce kendi makinenden ölç:

```bash
curl -o /dev/null -s -w '%{time_total}s\n' https://uncensored-llm.sbs/v1/models
```

| Şehir | Bölge |
|---|---|
| İstanbul | Marmara |
| Ankara | İç Anadolu |
| İzmir | Ege |
| Bursa | Marmara |
| Antalya | Akdeniz |
| Adana | Akdeniz |
| Konya | İç Anadolu |
| Gaziantep | Güneydoğu |
| Kayseri | İç Anadolu |
| Trabzon | Karadeniz |
| Diyarbakır | Güneydoğu |
| Samsun | Karadeniz |

## Gerçekten sorulan sorular

### OpenAI SDK ile gerçekten uyumlu mu?

Evet. /v1/chat/completions, /v1/models ve streaming SSE aynı olay formatını kullanıyor. Resmi SDK sadece base_url değiştirilerek çalışır.

### Ücretsiz veya deneme paketi var mı?

Güncel koşullar https://uncensored-llm.sbs adresinde yayınlanıyor. Fiyat değişiklikleri orada duyurulur, bu repoda değil.

### Ne engelleniyor?

Yasa dışı içerik, 18 yaş altını içeren her türlü materyal dahil. Bu kapsama girmeyen isteklerde cevap doğrudan istek hakkındadır.

### Open WebUI veya LibreChat ile kullanılır mı?

Kullanılır. İkisi de OpenAI uyumlu base URL kabul eder; https://uncensored-llm.sbs/v1 ve API anahtarını girmen yeterli.

### API anahtarını nasıl korurum?

Ortam değişkeninde tut, düzenli döndür, frontend'e ve herkese açık repoya asla koyma.

## Bu dokümantasyon diğer dillerde

- [pt-BR] https://brown1023.github.io/llm-api-sem-censura-brasil/
- [es-419] https://brown1023.github.io/api-llm-sin-censura-latam/
- [id-ID] https://ryuuless.github.io/uncensored-llm-api-indonesia/
- [vi-VN] https://ryuuless.github.io/uncensored-llm-api-vietnam/
- [de-DE] https://askcode24.github.io/uncensored-llm-api-deutschland/
- [es-ES] https://palazuel0s2004.github.io/api-llm-sin-censura-espana/
- [it-IT] https://palazuel0s2004.github.io/llm-api-senza-censura-italia/
- [en-IN] https://nirav0712.github.io/uncensored-llm-api-india/
- [en-PH] https://nirav0712.github.io/uncensored-llm-api-philippines/
- [ar] https://mohamedabderrehman.github.io/uncensored-llm-api-arabia/
- [ar-EG] https://mohamedabderrehman.github.io/uncensored-llm-api-egypt/

---

uncensored-llm.sbs — OpenAI uyumlu API. Yasa dışı içerik ve 18 yaş altını içeren materyal engellenir. Kalan her şey çağrıyı yapanın sorumluluğundadır.