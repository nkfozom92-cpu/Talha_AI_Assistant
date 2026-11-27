#!/data/data/com.termux/files/usr/bin/bash
set -e
cd "$(dirname "$0")"
pkg update -y
pkg install -y openjdk-17 aapt2 curl unzip
export JAVA_HOME="$PREFIX/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME="$HOME/android-sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
mkdir -p "$ANDROID_HOME/licenses"
printf '\n8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e\n24333f8a63b6825ea9c5514f83c2829b004d1fee\n' > "$ANDROID_HOME/licenses/android-sdk-license"
GH="$HOME/gradle-8.9"
if [ ! -x "$GH/bin/gradle" ]; then
  curl -L --fail -o "$HOME/gradle.zip" https://services.gradle.org/distributions/gradle-8.9-bin.zip
  unzip -q "$HOME/gradle.zip" -d "$HOME"; rm "$HOME/gradle.zip"
fi
echo "sdk.dir=$ANDROID_HOME" > local.properties
"$GH/bin/gradle" assembleDebug --no-daemon --console=plain -Pandroid.aapt2FromMavenOverride="$PREFIX/bin/aapt2" -Dorg.gradle.jvmargs="-Xmx1536m -Dfile.encoding=UTF-8"
APK="app/build/outputs/apk/debug/app-debug.apk"
mkdir -p "$HOME/storage/downloads" 2>/dev/null || true
if [ -d /sdcard/Download ]; then cp "$APK" /sdcard/Download/Talha-AI-Assistant.apk; echo "APK saved to Downloads/Talha-AI-Assistant.apk"; else cp "$APK" "$HOME/Talha-AI-Assistant.apk"; echo "APK saved in Termux home"; fi
