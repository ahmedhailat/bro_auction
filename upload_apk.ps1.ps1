# تعيين المسارات
$apkSource = "build\app\outputs\flutter-apk\app-release.apk"
$apkDestFolder = "apk"
$apkDest = "$apkDestFolder\app-release.apk"

# التحقق من وجود ملف APK
if (-Not (Test-Path $apkSource)) {
    Write-Host "❌ لم يتم العثور على ملف APK في المسار: $apkSource"
    exit
}

# إنشاء مجلد apk إذا لم يكن موجودًا
if (-Not (Test-Path $apkDestFolder)) {
    New-Item -ItemType Directory -Path $apkDestFolder | Out-Null
}

# نسخ الملف إلى مجلد apk
Copy-Item -Path $apkSource -Destination $apkDest -Force
Write-Host "✅ تم نسخ APK إلى $apkDest"

# تنفيذ أوامر Git
git add $apkDest
git commit -m "Add APK release"
git push

Write-Host "🚀 تم رفع ملف APK إلى GitHub بنجاح."
