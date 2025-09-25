# 🚀 دليل رفع المشروع إلى GitHub

## 📋 المتطلبات المسبقة

### تثبيت Git
إذا لم يكن Git مثبتاً على جهازك:
- **الموقع الرسمي:** https://git-scm.com/downloads
- **Windows:** حمل "Git for Windows"
- **Mac:** استخدم `brew install git`
- **Linux:** استخدم `sudo apt install git`

### إعداد Git (للمرة الأولى)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 🔧 خطوات رفع المشروع

### 1. تهيئة مستودع Git
```bash
cd "C:\Users\zigzag\Desktop\white diamond"
git init
```

### 2. إضافة جميع الملفات
```bash
git add .
```

### 3. حفظ التغييرات
```bash
git commit -m "first commit"
```

### 4. ربط المشروع بـ GitHub
```bash
git branch -M main
git remote add origin https://github.com/Mahmouddiab20/white-diamond-.git
```

### 5. رفع المشروع
```bash
git push -u origin main
```

## 🔄 تحديث المشروع لاحقاً

### عند إجراء تغييرات جديدة:
```bash
git add .
git commit -m "Update: وصف التغييرات"
git push origin main
```

### سحب التحديثات من GitHub:
```bash
git pull origin main
```

## 🌐 ربط المشروع بـ Netlify

### الطريقة الأولى: ربط GitHub
1. اذهب إلى [netlify.com](https://netlify.com)
2. اختر "New site from Git"
3. اختر GitHub
4. اختر مستودع `white-diamond-`
5. اضغط "Deploy site"

### الطريقة الثانية: السحب والإفلات
1. اسحب مجلد المشروع إلى Netlify
2. انتظر حتى يكتمل النشر

## 🆘 حل المشاكل الشائعة

### Git غير مثبت
```bash
git --version
```
إذا لم يظهر إصدار، قم بتثبيت Git من الموقع الرسمي

### رفض المصادقة
استخدم GitHub CLI أو Personal Access Token

### تضارب الملفات
```bash
git pull origin main
git push origin main
```

---

**المشروع جاهز للرفع! 🎉**