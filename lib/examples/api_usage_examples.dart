// API Service Usage Examples

import 'package:course/config/api_config.dart';
import 'package:course/Repository/user/user_service.dart';
import 'package:course/Repository/purchase/purchase_service.dart';
import 'package:course/Repository/cart/cart_service.dart';
import 'package:course/Repository/teacher/teacher_service.dart';
import 'package:course/Repository/module/module_service.dart';
import 'package:course/Repository/video/video_service.dart';
import 'package:course/Repository/courses/courses_service.dart';
import 'package:course/Repository/course_id/course_id_service.dart';
import 'package:course/Repository/banner/banner_service.dart';
import 'package:course/Repository/mentor_banner/mentorbanner_service.dart';

// ============================================
// 1. USER SERVICE
// ============================================
void exampleUserService() async {
  final userService = UserService();

  try {
    // Joriy foydalanuvchi ma'lumotlarini olish
    final user = await userService.getMe();
    print('User: ${user.fullName}, Role: ${user.role}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 2. PURCHASE SERVICE
// ============================================
void examplePurchaseService() async {
  final purchaseService = PurchaseService();

  try {
    // Sotib olingan kurslarni olish
    final myCourses = await purchaseService.getMyCourses();
    print('Sotib olingan kurslar soni: ${myCourses.length}');

    for (var course in myCourses) {
      print('Kurs: ${course.courseName}, Narx: ${course.price}');
    }
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 3. CART SERVICE
// ============================================
void exampleCartService() async {
  final cartService = CartService();

  try {
    // Savat ma'lumotlarini olish
    final cartItems = await cartService.getCartItems();
    print('Savatdagi elementlar: ${cartItems.length}');

    // Savatga kurs qo'shish
    final newItem = await cartService.addToCart(123);
    print('Savatga qo\'shildi: ${newItem.courseName}');

    // Savatdan o'chirish
    await cartService.removeFromCart(newItem.id);
    print('Savatdan o\'chirildi');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 4. TEACHER SERVICE
// ============================================
void exampleTeacherService() async {
  final teacherService = TeacherService();

  try {
    // Barcha teacherlarni olish
    final teachers = await teacherService.getAllTeachers();
    print('Teacherlar soni: ${teachers.length}');

    // Bitta teacherni olish
    final teacher = await teacherService.getTeacherById(1);
    print('Teacher: ${teacher.name}, Expertise: ${teacher.expertise}');

    // Teacher tokenga ega bo'lsa, uning studentlarini ko'rish
    // final students = await teacherService.getCoursePurchasers('teacher_token');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 5. MODULE SERVICE
// ============================================
void exampleModuleService() async {
  final moduleService = ModuleService();

  try {
    // Kurs bo'yicha modullarni olish
    final modules = await moduleService.getModulesByCourse(1);
    print('Modullar soni: ${modules.length}');

    for (var module in modules) {
      print('Modul: ${module.title}, Order: ${module.order}');
    }

    // Bitta modulni olish
    final module = await moduleService.getModuleById(1);
    print('Modul: ${module.title}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 6. VIDEO SERVICE
// ============================================
void exampleVideoService() async {
  final videoService = VideoService();

  try {
    // Modul bo'yicha videolarni olish
    final videos = await videoService.getVideosByModule(1);
    print('Videolar soni: ${videos.length}');

    for (var video in videos) {
      print('Video: ${video.title}, Duration: ${video.duration}s');
    }

    // Videoni ko'rilganini belgilash
    await videoService.markAsWatched(1);
    print('Video ko\'rildi deb belgilandi');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 7. COURSES SERVICE
// ============================================
void exampleCoursesService() async {
  final coursesService = CoursesService();

  try {
    // Barcha kurslarni olish
    final courses = await coursesService.fetchCourses();
    print('Kurslar soni: ${courses.length}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 8. COURSE ID SERVICE
// ============================================
void exampleCourseIdService() async {
  final courseIdService = CourseIdService();

  try {
    // Kursni ID bo'yicha olish
    final course = await courseIdService.getCourseId(1);
    print('Kurs nomi: ${course.data}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 9. BANNER SERVICE
// ============================================
void exampleBannerService() async {
  final bannerService = BannerService();

  try {
    // Bannerlarni olish
    final banners = await bannerService.getBanners();
    print('Bannerlar soni: ${banners.length}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// 10. MENTOR BANNER SERVICE
// ============================================
void exampleMentorBannerService() async {
  try {
    // Mentor bannerlarni olish
    final mentorBanners = await MentorbannerService.getMentorBanners();
    print('Mentor bannerlar soni: ${mentorBanners.length}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// TEACHER OPERATSIYALARI (Teacher token kerak)
// ============================================
void exampleTeacherOperations() async {
  final teacherToken = 'TEACHER_TOKEN_HERE';

  // Module operatsiyalari
  final moduleService = ModuleService();

  try {
    // Yangi modul yaratish
    final newModule = await moduleService.createModule(teacherToken, {
      'courseId': 1,
      'title': 'Yangi modul',
      'description': 'Modul tavsifi',
      'order': 1,
    });
    print('Yangi modul yaratildi: ${newModule.title}');

    // Modulni tahrirlash
    await moduleService.updateModule(teacherToken, newModule.id, {
      'title': 'Yangilangan modul',
    });

    // Modulni o'chirish
    // await moduleService.deleteModule(teacherToken, newModule.id);
  } catch (e) {
    print('Xatolik: $e');
  }

  // Video operatsiyalari
  final videoService = VideoService();

  try {
    // Yangi video yaratish
    final newVideo = await videoService.createVideo(teacherToken, {
      'moduleId': 1,
      'title': 'Yangi video',
      'url': 'https://example.com/video.mp4',
      'order': 1,
    });
    print('Yangi video yaratildi: ${newVideo.title}');
  } catch (e) {
    print('Xatolik: $e');
  }
}

// ============================================
// MAIN
// ============================================
void main() async {
  print('API Config Base URL: ${ApiConfig.baseUrl}');
  final token = await ApiConfig.getToken();
  print('Token mavjud: ${token.isNotEmpty}');

  // Barcha misol funksiyalarni ishga tushirish
  // await exampleUserService();
  // await examplePurchaseService();
  // await exampleCartService();
  // await exampleTeacherService();
  // await exampleModuleService();
  // await exampleVideoService();
  // await exampleCoursesService();
  // await exampleCourseIdService();
  // await exampleBannerService();
  // await exampleMentorBannerService();
  // await exampleTeacherOperations();
}
