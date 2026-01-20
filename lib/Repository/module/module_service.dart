import 'package:dio/dio.dart';
import '../../config/dio_client.dart';
import 'module_model.dart';

class ModuleService {
  final _dio = DioClient.instance;

  // Kurs bo'yicha modullarni olish
  Future<List<ModuleModel>> getModulesByCourse(int courseId) async {
    try {
      final response = await _dio.get(
        '/modul',
        queryParameters: {'courseId': courseId},
      );
      final data = response.data;
      final List modules = data is List ? data : (data['data'] ?? []);

      return modules
          .map((module) => ModuleModel.fromJson(module as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Modullar yuklanmadi: $e');
    }
  }

  // Modul ID bo'yicha olish
  Future<ModuleModel> getModuleById(int moduleId) async {
    try {
      final response = await _dio.get('/modul/$moduleId');
      return ModuleModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Modul yuklanmadi: $e');
    }
  }

  // Yangi modul yaratish (Teacher uchun)
  Future<ModuleModel> createModule(
    String teacherToken,
    Map<String, dynamic> moduleData,
  ) async {
    try {
      final response = await _dio.post(
        '/modul',
        data: moduleData,
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
      return ModuleModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Modul yaratish amalga oshmadi: $e');
    }
  }

  // Modulni tahrirlash (Teacher uchun)
  Future<ModuleModel> updateModule(
    String teacherToken,
    int moduleId,
    Map<String, dynamic> moduleData,
  ) async {
    try {
      final response = await _dio.put(
        '/modul/$moduleId',
        data: moduleData,
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
      return ModuleModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Modul tahrirlash amalga oshmadi: $e');
    }
  }

  // Modulni o'chirish (Teacher uchun)
  Future<void> deleteModule(String teacherToken, int moduleId) async {
    try {
      await _dio.delete(
        '/modul/$moduleId',
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
    } catch (e) {
      throw Exception("Modulni o'chirish amalga oshmadi: $e");
    }
  }
}
