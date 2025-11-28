import 'package:course/library.dart';
import 'package:course/Repository/course%20id/course_id_model.dart';
import 'package:http/http.dart' as http;

class CourseIdService {
  // Bu yerga o‘zingizning tokeningizni yozib qo‘ying
  static const String _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3NjQzMzU0NDksImV4cCI6MTc2OTUxOTQ0OX0.-SIx2hwaqY3tQ0gxjGzD7AFIqApBi4dRjJKenE0Gd-E";

  static const String _baseUrl = 'https://api.faksa.uz';

  Future<CourseIdModel> getCourseId(int courseId) async {
    final url = Uri.parse('$_baseUrl/courses/$courseId');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token', // Token avtomatik qo‘shiladi
      },
    );

    if (response.statusCode == 200) {
      return CourseIdModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      throw Exception('Token noto‘g‘ri yoki muddati tugagan (401)');
    } else {
      throw Exception(
          'Kurs yuklanmadi! Kod: ${response.statusCode}\nJavob: ${response.body}');
    }
  }
}