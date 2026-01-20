import 'package:dio/dio.dart';
import '../../config/dio_client.dart';
import 'purchase_model.dart';

class PurchaseService {
  final _dio = DioClient.instance;

  Future<List<PurchaseModel>> getMyCourses() async {
    try {
      final response = await _dio.get('/purchase/my-courses');
      final data = response.data;
      final List courses = data is List ? data : (data['data'] ?? []);

      return courses
          .map(
            (course) => PurchaseModel.fromJson(course as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Sotib olingan kurslar yuklanmadi: $e');
    }
  }

  // Custom token bilan
  Future<List<PurchaseModel>> getMyCoursesWithToken(String token) async {
    try {
      final response = await _dio.get(
        '/purchase/my-courses',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = response.data;
      final List courses = data is List ? data : (data['data'] ?? []);

      return courses
          .map(
            (course) => PurchaseModel.fromJson(course as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Sotib olingan kurslar yuklanmadi: $e');
    }
  }
}
