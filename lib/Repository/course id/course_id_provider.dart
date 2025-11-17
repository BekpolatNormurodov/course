import 'package:course/library.dart';
import 'package:course/Repository/course%20id/course_id_model.dart';

class CourseIdProvider extends ChangeNotifier {
  final CourseIdService apiService;

  CourseIdProvider({required this.apiService});

  // ignore: non_constant_identifier_names
  CourseIdModel? _CourseId;
  bool _isLoading = false;
  String? _error;

  CourseIdModel? get CourseId => _CourseId;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCourseId(int courseId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await apiService.getCourseId(courseId);
      _CourseId = result;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
