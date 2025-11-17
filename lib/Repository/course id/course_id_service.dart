import 'package:course/library.dart';
import 'package:course/Repository/course%20id/course_id_model.dart';
import 'package:http/http.dart' as http;

class CourseIdService {
  final String baseUrl;

  CourseIdService({
    this.baseUrl = 'https://api.faksa.uz',
  });

  Future<CourseIdModel> getCourseId(int courseId) async {
    final url = Uri.parse('$baseUrl/courses/$courseId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return CourseIdModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kurs maʼlumotini yuklab bo‘lmadi. Kod: ${response.statusCode}');
    }
  }
}
