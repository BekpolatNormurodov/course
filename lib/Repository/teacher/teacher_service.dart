import 'package:dio/dio.dart';
import '../../config/dio_client.dart';
import 'teacher_model.dart';

class TeacherService {
  final _dio = DioClient.instance;

  // Teacher ma'lumotlarini olish
  Future<TeacherModel> getTeacherById(int teacherId) async {
    try {
      final response = await _dio.get('/teacher/$teacherId');
      return TeacherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Teacher ma\'lumotlari yuklanmadi: $e');
    }
  }

  // Teacher kursini sotib olgan studentlarni ko'rish (Teacher token kerak)
  Future<List<StudentPurchaserModel>> getCoursePurchasers(
    String teacherToken,
  ) async {
    try {
      final response = await _dio.get(
        '/courses/purchasers/students',
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
      final data = response.data;
      final List students = data is List ? data : (data['data'] ?? []);

      return students
          .map(
            (student) =>
                StudentPurchaserModel.fromJson(student as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Studentlar ro\'yxati yuklanmadi: $e');
    }
  }

  // Barcha teacherlarni olish
  Future<List<TeacherModel>> getAllTeachers() async {
    try {
      final response = await _dio.get('/teacher');
      final data = response.data;
      final List teachers = data is List ? data : (data['data'] ?? []);

      return teachers
          .map(
            (teacher) => TeacherModel.fromJson(teacher as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception("Teacherlar ro'yxati yuklanmadi: $e");
    }
  }
}
