import 'package:dio/dio.dart';
import '../../config/dio_client.dart';
import 'video_model.dart';

class VideoService {
  final _dio = DioClient.instance;

  // Modul bo'yicha videolarni olish
  Future<List<VideoModel>> getVideosByModule(int moduleId) async {
    try {
      final response = await _dio.get(
        '/videos',
        queryParameters: {'moduleId': moduleId},
      );
      final data = response.data;
      final List videos = data is List ? data : (data['data'] ?? []);

      return videos
          .map((video) => VideoModel.fromJson(video as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Videolar yuklanmadi: $e');
    }
  }

  // Video ID bo'yicha olish
  Future<VideoModel> getVideoById(int videoId) async {
    try {
      final response = await _dio.get('/videos/$videoId');
      return VideoModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Video yuklanmadi: $e');
    }
  }

  // Yangi video yaratish (Teacher uchun)
  Future<VideoModel> createVideo(
    String teacherToken,
    Map<String, dynamic> videoData,
  ) async {
    try {
      final response = await _dio.post(
        '/videos',
        data: videoData,
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
      return VideoModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Video yaratish amalga oshmadi: $e');
    }
  }

  // Videoni tahrirlash (Teacher uchun)
  Future<VideoModel> updateVideo(
    String teacherToken,
    int videoId,
    Map<String, dynamic> videoData,
  ) async {
    try {
      final response = await _dio.put(
        '/videos/$videoId',
        data: videoData,
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
      return VideoModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Video tahrirlash amalga oshmadi: $e');
    }
  }

  // Videoni o'chirish (Teacher uchun)
  Future<void> deleteVideo(String teacherToken, int videoId) async {
    try {
      await _dio.delete(
        '/videos/$videoId',
        options: Options(headers: {'Authorization': 'Bearer $teacherToken'}),
      );
    } catch (e) {
      throw Exception("Videoni o'chirish amalga oshmadi: $e");
    }
  }

  // Video ko'rilganini belgilash
  Future<void> markAsWatched(int videoId) async {
    try {
      await _dio.put('/videos/$videoId/watched');
    } catch (e) {
      throw Exception("Video ko'rilganini belgilash amalga oshmadi: $e");
    }
  }
}
