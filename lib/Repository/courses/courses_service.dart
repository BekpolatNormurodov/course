import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'courses_model.dart';

class CoursesService {
  final _base = Uri.parse('https://api.faksa.uz/courses');

  Future<List<CoursesModel>> fetchCourses() async {
    final r = await http
        .get(_base, headers: {HttpHeaders.acceptHeader: 'application/json'})
        .timeout(const Duration(seconds: 20));

    if (r.statusCode != 200) {
      throw HttpException('HTTP ${r.statusCode} ${r.reasonPhrase}', uri: _base);
    }

    final decoded = jsonDecode(r.body);
    final List list = (decoded is Map && decoded['data'] is List)
        ? decoded['data'] as List
        : (decoded is List ? decoded : []);

    return list
        .map((e) => CoursesModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
