# Talha AI Assistant — Android project

এটি আপনার দেওয়া `AI-Assistant.apk` দেখে তৈরি করা একটি **নতুন/original starter project**। একই ধরনের modern AI chat experience, dark-purple UI, animated welcome orb, chat history এবং settings রাখা হয়েছে। মূল APK-এর private source code, character artwork বা proprietary implementation কপি করা হয়নি। তাই এটি হুবহু clone নয় এবং মূল অ্যাপের সব phone-control/voice/camera automation এতে নেই।

## GitHub-এ ZIP upload
1. GitHub-এ নতুন repository খুলুন।
2. ZIP extract করে ভেতরের ফাইলগুলো repository-র root-এ upload করুন। ZIP-কে repository-তে শুধু upload করলে GitHub/Termux source code স্বয়ংক্রিয়ভাবে খুলে দেখাবে না—আগে extract করতে হবে।
3. Termux-এ repository clone করুন অথবা GitHub থেকে ZIP download করে extract করুন।

## Termux-এ build
```bash
pkg update -y
pkg install -y git unzip
# GitHub repository clone করার উদাহরণ:
git clone YOUR_REPOSITORY_URL
cd Talha_AI_Assistant_Project
chmod +x build-termux.sh
bash build-termux.sh
```
প্রথম build-এ ইন্টারনেট ও কয়েক GB খালি storage লাগতে পারে। APK পাওয়া যাবে `/sdcard/Download/Talha-AI-Assistant.apk`-এ।

## AI চালু করা
অ্যাপ খুলে Settings-এ গিয়ে নিজের Gemini API key দিন এবং Save settings চাপুন। API key source code-এ রাখা হয়নি। এই starter app key-টি এই ডিভাইসের WebView localStorage-এ রাখে; এটি production-grade secret storage নয়। Public release করার আগে নিরাপদ backend/proxy ব্যবহার করুন।

## Project structure
- `app/src/main/java/.../MainActivity.kt` — Android WebView wrapper
- `app/src/main/assets/index.html` — UI
- `style.css` — colors, responsive layout, animation
- `app.js` — chat, local history, Gemini API call, settings
- `build-termux.sh` — Termux build script

## সীমাবদ্ধতা
এটি starter version। Voice conversation, live camera vision, notifications automation, accessibility/phone actions, licensing, admin dashboard এবং cloud sync implement করা হয়নি। Build পরিবেশভেদে Gradle/SDK download বা memory error হতে পারে।
