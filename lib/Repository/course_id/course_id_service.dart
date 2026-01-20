import 'package:course/library.dart';
import 'package:course/Repository/course_id/course_id_model.dart';
import '../../config/dio_client.dart';

class CourseIdService {
  final _dio = DioClient.instance;

  Future<CourseIdModel> getCourseId(int courseId) async {
    try {
      final response = await _dio.get('/courses/$courseId');
      return CourseIdModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Kurs yuklanmadi: $e');
    }
  }
}
