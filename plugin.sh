#!/bin/bash

echo "➡️ Capacitor Android plugin setup başlıyor..."

PLUGIN_PACKAGE="com.pdfreader.app"
PLUGIN_CLASS="AndroidFullFileAccess"
ANDROID_PATH="android/app/src/main/java"

if [ ! -d "android/app" ]; then
  echo "❌ Android platformu yok! Önce: npx cap add android"
  exit 0
fi

PLUGIN_DIR="$ANDROID_PATH/$(echo $PLUGIN_PACKAGE | tr . /)"
mkdir -p "$PLUGIN_DIR"

PLUGIN_FILE="$PLUGIN_DIR/$PLUGIN_CLASS.java"

cat <<EOF > "$PLUGIN_FILE"
package $PLUGIN_PACKAGE;

import android.content.Intent;
import android.provider.Settings;

import com.getcapacitor.Plugin;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.PluginCall;

@CapacitorPlugin(name = "AndroidFullFileAccess")
public class $PLUGIN_CLASS extends Plugin {

    public void openSettings(PluginCall call) {
        Intent intent = new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
        getActivity().startActivity(intent);
        call.resolve();
    }
}
EOF

echo "✔️ Plugin sınıfı oluşturuldu: $PLUGIN_FILE"

# -------- MAINACTIVITY OTOMATİK BUL --------
MAIN_ACTIVITY=$(find android/app/src/main/java -name "MainActivity.java")

if [ -z "$MAIN_ACTIVITY" ]; then
    echo "❌ MainActivity bulunamadı!"
    exit 0
fi

echo "➡️ Bulunan MainActivity: $MAIN_ACTIVITY"

if grep -q "$PLUGIN_CLASS" "$MAIN_ACTIVITY"; then
    echo "ℹ️ Plugin zaten kayıtlı."
else
    echo "➡️ MainActivity'ye plugin kaydediliyor..."
    sed -i "/super.onCreate/a\        registerPlugin($PLUGIN_CLASS.class);" "$MAIN_ACTIVITY"
fi

echo "✔️ Plugin kurulumu tamamlandı!"
