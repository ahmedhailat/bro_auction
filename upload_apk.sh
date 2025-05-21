#!/bin/bash

echo "🚀 بدء عملية بناء ملف APK..."

flutter build apk --release

APK_PATH="build/app/outputs/flutter-apk/app-release.apk"
DEST_DIR="apk"

if [ -f "$APK_PATH" ]; then
  echo "✅ تم بناء الملف بنجاح: $APK_PATH"

  # أنشئ مجلد apk إذا لم يكن موجودًا
  mkdir -p "$DEST_DIR"

  # انسخ الملف
  cp "$APK_PATH" "$DEST_DIR/"

  echo "📦 تم نسخ APK إلى مجلد: $DEST_DIR"

  # أضف إلى git وادفع التغييرات
  git add "$DEST_DIR/app-release.apk"
  git commit -m "Add release APK"
  git push

  echo "🎉 تم رفع APK إلى GitHub بنجاح."
else
  echo "❌ فشل في العثور على الملف: $APK_PATH"
  echo "⚠️ تأكد من أن البناء تم بنجاح."
fi
