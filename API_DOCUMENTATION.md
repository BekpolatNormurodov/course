# Online Kurs API Documentation

**Base URL:** `https://api.faksa.uz`

**Authentication:** Bearer Token

**Default Token:** 
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3NjQzMzU0NDksImV4cCI6MTc2OTUxOTQ0OX0.-SIx2hwaqY3tQ0gxjGzD7AFIqApBi4dRjJKenE0Gd-E
```

---

## API Endpoints

### 1. **Courses**

#### 1.1 GET All Courses
**Endpoint:** `/courses`

**Method:** GET

**Headers:**
- `Authorization: Bearer {token}`

**Query Parameters:**
- `category` (string) - e.g., "Новые курсы"
- `direction` (string) - e.g., "Programming"
- `author_name` (string) - e.g., "Javohir"
- `languages` (string) - e.g., "Uzbek language"
- `education_level` (string) - e.g., "Beginner"
- `price_min` (number) - e.g., 600000
- `price_max` (number) - e.g., 800000

**Description:** Barcha kurslarni olish. 3 ta tilli datalar qaytaradi. Filter qilish mumkin.

---

#### 1.2 GET Course by ID
**Endpoint:** `/courses/:id`

**Method:** GET

**Headers:**
- `Authorization: Bearer {token}`

**Description:** Kursni ID bo'yicha to'liq ma'lumotlarini olish.

---

#### 1.3 POST Create Course (Teacher only)
**Endpoint:** `/courses`

**Method:** POST

**Headers:**
- `Authorization: Bearer {teacher_token}`
- `Content-Type: application/json`

**Description:** Teacher o'zining cabinetidan yangi kurs qo'shish.

---

#### 1.4 PUT Update Course (Teacher only)
**Endpoint:** `/courses/:id`

**Method:** PUT

**Headers:**
- `Authorization: Bearer {teacher_token}`
- `Content-Type: application/json`

**Description:** O'zingizga tegishli kursni tahrirlash.

---

#### 1.5 DELETE Course (Teacher only)
**Endpoint:** `/courses/:id`

**Method:** DELETE

**Headers:**
- `Authorization: Bearer {teacher_token}`

**Description:** O'zingizga tegishli kursni butunlay o'chirish.

---

#### 1.6 PATCH Block Course (Teacher only)
**Endpoint:** `/courses/block/:id`

**Method:** PATCH

**Headers:**
- `Authorization: Bearer {teacher_token}`

**Description:** Kursni bloklash.

---

#### 1.7 PATCH Unblock Course (Teacher only)
**Endpoint:** `/courses/unblock/:id`

**Method:** PATCH

**Headers:**
- `Authorization: Bearer {teacher_token}`

**Description:** Kursni blokdan chiqarish.

---

#### 1.8 GET Course Purchasers (Teacher only)
**Endpoint:** `/courses/purchasers/students`

**Method:** GET

**Headers:**
- `Authorization: Bearer {teacher_token}`

**Description:** Sizga tegishli kursda qaysi o'quvchilar foydalanayotganini ko'rish.

---

### 2. **Purchase**

#### 2.1 GET My Courses
**Endpoint:** `/purchase/my-courses`

**Method:** GET

**Headers:**
- `Authorization: Bearer {token}`

**Description:** O'zingiz sotib olgan kurslarni ko'rish.

---

### 3. **Banner**

#### 3.1 GET All Banners
**Endpoint:** `/banner`

**Method:** GET

**Description:** Barcha bannerlarni olish (home page uchun).

---

### 4. **Mentor Banner**

#### 4.1 GET Teacher Banners
**Endpoint:** `/banner/teacher`

**Method:** GET

**Description:** Teacher bannerlarini olish.

---

### 5. **User**

#### 5.1 GET Current User (ME)
**Endpoint:** `/me`

**Method:** GET

**Headers:**
- `Authorization: Bearer {token}`

**Description:** Joriy foydalanuvchi ma'lumotlarini olish.

---

### 6. **Cart**

**Endpoint:** `/cart`

**Methods:** GET, POST, DELETE

**Headers:**
- `Authorization: Bearer {token}`

**Description:** Savat bilan ishlash.

---

### 7. **Teacher**

**Endpoint:** `/teacher`

**Description:** Teacher ma'lumotlari va operatsiyalari.

---

### 8. **Module**

**Endpoint:** `/modul`

**Description:** Kurs modullari bilan ishlash.

---

### 9. **Videos**

**Endpoint:** `/videos`

**Description:** Video ma'lumotlari va operatsiyalari.

---

## Implementation Status

- ✅ Courses (GET all, GET by ID)
- ✅ Banner (GET)
- ✅ Mentor Banner (GET)
- 🔄 Purchase (my-courses)
- 🔄 User (ME)
- 🔄 Cart
- 🔄 Teacher
- 🔄 Module
- 🔄 Videos

---

## Notes

- Barcha API'lar uchun base URL: `https://api.faksa.uz`
- Token bilan ishlash uchun `api_config.dart` faylidan foydalaniladi
- Default token student role bilan ishlaydi
- Teacher operatsiyalari uchun teacher_token kerak bo'ladi
