import 'package:course/library.dart';
import 'package:course/Repository/course id/course_id_model.dart';

class CourseIdProvider extends ChangeNotifier {
  final CourseIdService api;
  CourseIdProvider(this.api);

  bool isLoading = false;
  String? error;
  CourseIdModel? data;   // ❗ endi List emas, bitta model

  Future<void> load(int courseId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      // ❗ hech qanday `as List<CourseIdModel>` YO‘Q
      data = await api.getCourseId(courseId);
    } catch (e) {
      error = e.toString();
      data = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
