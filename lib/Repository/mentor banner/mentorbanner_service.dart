// Mentor_banner_service.dart
import 'dart:convert';
import 'package:course/Repository/mentor%20banner/mentorbanner_model.dart';
import 'package:http/http.dart' as http;

class MentorBannerService {
  static const String _baseUrl = 'https://api.faksa.uz';

  Future<List<MentorBannerModel>> getMentorBanners() async {
    try {
      final uri = Uri.parse('$_baseUrl/banner/teacher');

      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Mentor Banner Status: ${response.statusCode}');
      print('Mentor Banner Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // API { "data": [ ... ] } shaklida qaytaradi
        if (jsonResponse['data'] is List) {
          // Toʻgʻri yozilgan
          final List list =
              jsonResponse['data'] as List; // Nuqta vergul qoʻshildi
          return list.map((item) => MentorBannerModel.fromJson(item)).toList();
        } else {
          throw Exception('API dan "data" kaliti topilmadi yoki list emas');
        }
      } else {
        throw Exception(
          'Mentor banner yuklashda xatolik: ${response.statusCode}',
        );
      }
    } on http.ClientException {
      throw Exception('Internet aloqasi yoʻq');
    } on FormatException {
      throw Exception('Serverdan notoʻgʻri JSON keldi');
    } catch (e) {
      throw Exception('Kutilmagan xatolik: $e');
    }
  }
}
