// banner_service.dart
import 'dart:convert';
import 'package:course/Repository/banner/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerService {
  static const String _baseUrl = 'https://api.faksa.uz';

  /// Bannerlarni olish uchun asosiy metod
  Future<List<BannerModel>> getBanners() async {
    try {
      final uri = Uri.parse('$_baseUrl/banner');

      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Agar token kerak bo'lsa, quyidagini oching:
          // 'Authorization': 'Bearer ${await _getToken()}',
        },
      );

      // Debug uchun
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Sizning API { "data": [ ... ] } shaklida qaytaryapti
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          final List list = jsonResponse['data'];
          return list.map((item) => BannerModel.fromJson(item)).toList();
        } else {
          // Agar "data" kaliti bo'lmasa, to'g'ridan-to'g'ri list bo'lishi ham mumkin
          final List list = jsonResponse as List;
          return list.map((item) => BannerModel.fromJson(item)).toList();
        }
      } else {
        // Xato bo'lsa, serverdan kelgan xabarni ko'rsatish uchun
        throw Exception(
          'Bannerlarni yuklashda xatolik: ${response.statusCode} - ${response.body}',
        );
      }
    } on http.ClientException catch (e) {
      throw Exception('Internet aloqasi muammosi: $e');
    } on FormatException catch (e) {
      throw Exception('JSON formati noto‘g‘ri: $e');
    } catch (e) {
      throw Exception('Kutilmagan xatolik: $e');
    }
  }

  // Agar token Hive dan olinishi kerak bo'lsa, quyidagi metodni ishlatishingiz mumkin:
  // Future<String> _getToken() async {
  //   final box = await Hive.openBox('token');
  //   return box.get('token') ?? '';
  // }
}