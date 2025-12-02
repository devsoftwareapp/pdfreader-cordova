#!/bin/bash

echo "📦 PDF Reader için gerekli pluginler yükleniyor..."

# 1. TEMEL DOSYA İŞLEMLERİ (ZORUNLU)
cordova plugin add cordova-plugin-file@7.0.0

# 2. DOSYA TRANSFER (PDF KAYDETME) (ZORUNLU)
cordova plugin add cordova-plugin-file-transfer@1.7.1

# 3. ANDROİD İZİN YÖNETİMİ (ZORUNLU)
cordova plugin add cordova-plugin-android-permissions@1.1.3

# 4. DOSYA AÇMA (PDF'Yİ AÇMAK İÇİN) (ZORUNLU)
cordova plugin add cordova-plugin-file-opener2@3.0.5

# 5. DİALOG/ALERT MESAJLARI (TAVSİYE EDİLEN)
cordova plugin add cordova-plugin-dialogs@2.0.2

# 6. SPLASH SCREEN (OPSİYONEL)
cordova plugin add cordova-plugin-splashscreen@6.0.2

# 7. STATUS BAR KONTROLÜ (OPSİYONEL)
cordova plugin add cordova-plugin-statusbar@3.0.0

echo "✅ Tüm pluginler başarıyla yüklendi!"
echo ""
echo "📋 YÜKLENEN PLUGINLER:"
echo "1. cordova-plugin-file        - Dosya sistemi erişimi"
echo "2. cordova-plugin-file-transfer - PDF kaydetme/indirme"
echo "3. cordova-plugin-android-permissions - Android izinleri"
echo "4. cordova-plugin-file-opener2 - Kaydedilen PDF'yi açma"
echo "5. cordova-plugin-dialogs     - Alert/Confirm mesajları"
echo "6. cordova-plugin-splashscreen - Başlangıç ekranı"
echo "7. cordova-plugin-statusbar   - Status bar kontrolü"
