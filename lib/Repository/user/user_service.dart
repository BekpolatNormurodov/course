import 'package:dio/dio.dart';
import '../../config/dio_client.dart';
import 'user_model.dart';

class UserService {
  final _dio = DioClient.instance;

  Future<UserModel> getMe() async {
    try {
      final response = await _dio.get('/me');
      final data = response.data['data'] ?? response.data;
      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception('User ma\'lumotlari yuklanmadi: $e');
    }
  }

  // Custom token bilan
  Future<UserModel> getMeWithToken(String token) async {
    try {
      final response = await _dio.get(
        '/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = response.data['data'] ?? response.data;
      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception('User ma\'lumotlari yuklanmadi: $e');
    }
  }

  // User ma'lumotlarini yangilash (PATCH)
  Future<UserModel> updateMe({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? birthDate,
    String? gender,
  }) async {
    try {
      final Map<String, dynamic> data = {};

      if (firstName != null) data['first_name'] = firstName;
      if (lastName != null) data['last_name'] = lastName;
      if (email != null) data['email'] = email;
      if (phoneNumber != null) data['phone_number'] = phoneNumber;
      if (birthDate != null) data['birth_date'] = birthDate;
      if (gender != null) data['gender'] = gender;

      final response = await _dio.put('/me', data: data);
      final responseData = response.data['data'] ?? response.data;
      return UserModel.fromJson(responseData);
    } catch (e) {
      throw Exception('User ma\'lumotlarini yangilash amalga oshmadi: $e');
    }
  }

  // Upload profile image (PUT /me with image field)
  Future<UserModel> uploadImage(String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath, filename: fileName),
      });

      final response = await _dio.put('/me', data: formData);
      final responseData = response.data['data'] ?? response.data;
      return UserModel.fromJson(responseData);
    } catch (e) {
      throw Exception('Rasmni yuklash amalga oshmadi: $e');
    }
  }
}
