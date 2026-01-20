// Mentor_banner_provider.dart
import 'package:course/Repository/mentor_banner/mentorbanner_model.dart';
import 'package:course/Repository/mentor_banner/mentorbanner_service.dart';
import 'package:flutter/foundation.dart';

enum MentorBannerStatus { initial, loading, success, error }

class MentorBannerProvider extends ChangeNotifier {
  MentorBannerStatus _status = MentorBannerStatus.initial;
  MentorBannerStatus get status => _status;

  List<MentorBannerModel> _banners = [];
  List<MentorBannerModel> get banners => _banners;

  String _error = '';
  String get error => _error;

  bool get isLoading => _status == MentorBannerStatus.loading;
  bool get hasData => _banners.isNotEmpty;

  Future<void> fetchMentorBanners() async {
    _status = MentorBannerStatus.loading;
    notifyListeners();

    try {
      final data = await MentorbannerService.getMentorBanners();
      _banners = data;
      _status = MentorBannerStatus.success;
      _error = '';
    } catch (e) {
      _banners = [];
      _status = MentorBannerStatus.error;
      _error = e.toString().replaceFirst('Exception: ', '');
      if (kDebugMode) print('MentorBannerProvider error: $e');
    } finally {
      notifyListeners();
    }
  }
}
