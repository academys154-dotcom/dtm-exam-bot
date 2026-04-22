# Maktab Imtihon Bot

Bu loyiha Telegram bot bo'lib, 9-sinf va 11-sinf o'quvchilari uchun yakuniy imtihon uslubidagi testlarni qulay ishlashga moslashtirilgan.

## Asosiy imkoniyatlar

- `/start` dan keyin foydalanuvchini ro'yxatdan o'tkazadi
- Ism, telefon va sinfni saqlaydi
- Telefon faqat Telegram contact tugmasi orqali qabul qilinadi
- Demo test faqat 1 marta ishlaydi
- Bir martalik kod orqali test materiali/PDF olish tizimi bor
- User javoblarni bir nechta formatda yubora oladi:
  - `ABCDABCD`
  - `A B C D`
  - `1-A, 2-B, 3-C ...`
- `✅ Test tekshirish` bo'limi javob formatini ko'rsatadi
- Natijani to'g'ri/xato/bo'sh, foiz va taxminiy 5 ballik baho bilan chiqaradi
- Admin test qo'shadi, o'chiradi va kod yaratadi
- Admin userlar va natijalarni XLSX yoki PDF qilib export qiladi
- Admin umumiy statistikani ko'radi
- Bot polling rejimida ishlaydi

## Texnologiyalar

- Python 3.12+
- aiogram 3
- SQLite
- openpyxl
- reportlab
- python-dotenv

## Lokal ishga tushirish

### 1) Paketlarni o'rnatish

```bash
pip install -r requirements.txt
```

### 2) `.env` tayyorlash

```bash
cp .env.example .env
```

Keyin quyidagilarni to'ldiring:

- `BOT_TOKEN` — BotFather dan olgan token
- `ADMIN_IDS` — admin Telegram user id lar
- `DB_PATH` — SQLite bazasi manzili
- `HELP_ADMIN_URL` — yordam bo'limida ko'rsatiladigan admin linki, ixtiyoriy
- `HELP_ADMIN_LABEL` — yordam tugmasi matni, ixtiyoriy
- `BOT_BRAND_NAME` — bot nomi

### 3) Botni ishga tushirish

```bash
python app/main.py
```

## Docker bilan ishga tushirish

### Image build qilish

```bash
docker build -t dtm-exam-bot .
```

### Container run qilish

```bash
docker run -d \
  --name dtm-exam-bot \
  --restart unless-stopped \
  --env-file .env \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/exports:/app/exports \
  dtm-exam-bot
```

## VPS ga joylash tavsiyasi

- `.env` ni to'g'ri to'ldiring
- `data/` va `exports/` papkalariga yozish huquqi bo'lsin
- `screen`, `tmux`, `systemd` yoki Docker bilan 24/7 ishlating
- SQLite faylni saqlab qolish uchun `data/` ni backup qiling

## Muhim eslatma

- Foydalanuvchi telefon raqami qo'lda yozib qabul qilinmaydi
- Admin test qo'shishda faqat PDF qabul qilinadi
- `Clear all` Telegram API cheklovlari sababli barcha xabarlarni har doim 100% o'chirmasligi mumkin
- `drop_pending_updates=True` yoqilgan, shuning uchun bot o'chib turgan paytdagi eski update lar tashlab yuboriladi
