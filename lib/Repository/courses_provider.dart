import 'package:flutter/foundation.dart';
import 'courses_model.dart';
import 'courses_service.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesService api;
  CoursesProvider(this.api);

  bool isLoading = false;
  String? error;
  List<CoursesModel> data = [];

  Future<void> load() async {
    isLoading = true; error = null; notifyListeners();
    try {
      data = await api.fetchCourses();
    } catch (e) {
      error = e.toString();
      data = [];
    } finally {
      isLoading = false; notifyListeners();
    }
  }
}
