# Backend Integration Summary

## ✅ Yaratilgan fayllar

### 1. **API Configuration**
- 📁 `lib/config/api_config.dart` - Markazlashtirilgan API konfiguratsiyasi
  - Base URL: `https://api.faksa.uz`
  - Default Token bilan
  - Header management

### 2. **User Service** ✨
- 📁 `lib/Repository/user/user_model.dart`
- 📁 `lib/Repository/user/user_service.dart`
- 🔗 GET `/me` - Joriy foydalanuvchi ma'lumotlari

### 3. **Purchase Service** ✨
- 📁 `lib/Repository/purchase/purchase_model.dart`
- 📁 `lib/Repository/purchase/purchase_service.dart`
- 🔗 GET `/purchase/my-courses` - Sotib olingan kurslar

### 4. **Cart Service** ✨
- 📁 `lib/Repository/cart/cart_model.dart`
- 📁 `lib/Repository/cart/cart_service.dart`
- 🔗 GET `/cart` - Savat itemlarini olish
- 🔗 POST `/cart` - Savatga qo'shish
- 🔗 DELETE `/cart/:id` - Savatdan o'chirish
- 🔗 DELETE `/cart/clear` - Savatni tozalash

### 5. **Teacher Service** ✨
- 📁 `lib/Repository/teacher/teacher_model.dart`
- 📁 `lib/Repository/teacher/teacher_service.dart`
- 🔗 GET `/teacher` - Barcha teacherlar
- 🔗 GET `/teacher/:id` - Teacher ma'lumotlari
- 🔗 GET `/courses/purchasers/students` - Kurs sotib olgan studentlar (Teacher uchun)

### 6. **Module Service** ✨
- 📁 `lib/Repository/module/module_model.dart`
- 📁 `lib/Repository/module/module_service.dart`
- 🔗 GET `/modul?courseId=:id` - Kurs modullari
- 🔗 GET `/modul/:id` - Modul ma'lumotlari
- 🔗 POST `/modul` - Yangi modul (Teacher)
- 🔗 PUT `/modul/:id` - Modulni tahrirlash (Teacher)
- 🔗 DELETE `/modul/:id` - Modulni o'chirish (Teacher)

### 7. **Video Service** ✨
- 📁 `lib/Repository/video/video_model.dart`
- 📁 `lib/Repository/video/video_service.dart`
- 🔗 GET `/videos?moduleId=:id` - Modul videolari
- 🔗 GET `/videos/:id` - Video ma'lumotlari
- 🔗 POST `/videos` - Yangi video (Teacher)
- 🔗 PUT `/videos/:id` - Videoni tahrirlash (Teacher)
- 🔗 DELETE `/videos/:id` - Videoni o'chirish (Teacher)
- 🔗 PATCH `/videos/:id/watched` - Video ko'rildi

### 8. **Yangilangan Servicelar**
- ✅ `lib/Repository/courses/courses_service.dart` - ApiConfig ishlatadi
- ✅ `lib/Repository/course id/course_id_service.dart` - ApiConfig ishlatadi
- ✅ `lib/Repository/banner/banner_service.dart` - ApiConfig ishlatadi
- ✅ `lib/Repository/mentor banner/mentorbanner_service.dart` - ApiConfig ishlatadi

### 9. **Documentation**
- 📄 `API_DOCUMENTATION.md` - To'liq API dokumentatsiyasi
- 📄 `lib/examples/api_usage_examples.dart` - Qo'llanish misollari

---

## 🔑 Token Management

Default token `api_config.dart` faylida:
```dart
static const String defaultToken = 
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3NjQzMzU0NDksImV4cCI6MTc2OTUxOTQ0OX0.-SIx2hwaqY3tQ0gxjGzD7AFIqApBi4dRjJKenE0Gd-E";
```

Bu token student role bilan ishlaydi va barcha API'larda default sifatida ishlatiladi.

---

## 📊 API Endpoints

| # | Endpoint | Method | Service | Status |
|---|----------|--------|---------|--------|
| 1 | `/courses` | GET | CoursesService | ✅ |
| 2 | `/courses/:id` | GET | CourseIdService | ✅ |
| 3 | `/banner` | GET | BannerService | ✅ |
| 4 | `/banner/teacher` | GET | MentorbannerService | ✅ |
| 5 | `/me` | GET | UserService | ✅ |
| 6 | `/purchase/my-courses` | GET | PurchaseService | ✅ |
| 7 | `/cart` | GET/POST/DELETE | CartService | ✅ |
| 8 | `/teacher` | GET | TeacherService | ✅ |
| 9 | `/modul` | GET/POST/PUT/DELETE | ModuleService | ✅ |
| 10 | `/videos` | GET/POST/PUT/DELETE/PATCH | VideoService | ✅ |

---

## 🚀 Qo'llanish

### 1. User ma'lumotlarini olish:
```dart
final userService = UserService();
final user = await userService.getMe();
print('User: ${user.name}');
```

### 2. Sotib olingan kurslarni ko'rish:
```dart
final purchaseService = PurchaseService();
final myCourses = await purchaseService.getMyCourses();
```

### 3. Savatga kurs qo'shish:
```dart
final cartService = CartService();
await cartService.addToCart(courseId);
```

### 4. Kurs modullari va videolarni olish:
```dart
final moduleService = ModuleService();
final modules = await moduleService.getModulesByCourse(courseId);

final videoService = VideoService();
final videos = await videoService.getVideosByModule(moduleId);
```

---

## ⚙️ API Config Sozlamalari

`lib/config/api_config.dart` faylida:

```dart
// Default headers (student token bilan)
ApiConfig.headers

// Custom token bilan headers
ApiConfig.headersWithToken(yourToken)

// Public headers (token yo'q)
ApiConfig.publicHeaders
```

---

## 📝 Eslatmalar

1. **Token Expiry**: Default token `exp: 1769519449` (May 2026) gacha amal qiladi
2. **Teacher Operatsiyalari**: Teacher tokenni alohida olish kerak
3. **Error Handling**: Barcha servicelarda 401 va boshqa errorlar handle qilingan
4. **UI tegmadim**: Faqat backend integration qilindi

---

## 🎯 Keyingi Qadamlar

Endi siz:
- ✅ Barcha API'lardan foydalanishingiz mumkin
- ✅ ApiConfig orqali token boshqarishingiz mumkin
- ✅ UI'da bu servicelarni integratsiya qilishingiz mumkin
- ✅ `lib/examples/api_usage_examples.dart` faylidan namunalar olishingiz mumkin

---

**Barcha backend ulanishlar tayyor!** 🎉
