// banner_provider.dart
import 'package:course/Repository/banner/banner_model.dart';
import 'package:course/Repository/banner/banner_service.dart';
import 'package:flutter/foundation.dart';

enum BannerStatus { initial, loading, success, error }

class BannerProvider extends ChangeNotifier {
  BannerStatus _status = BannerStatus.initial;
  BannerStatus get status => _status;

  List<BannerModel> _banners = [];
  List<BannerModel> get banners => _banners;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool get isLoading => _status == BannerStatus.loading;
  bool get isSuccess => _status == BannerStatus.success;
  bool get hasError => _status == BannerStatus.error;
  bool get hasData => _banners.isNotEmpty;

  final BannerService _bannerService = BannerService();

  /// Bannerlarni yuklash
  Future<void> fetchBanners() async {
    if (_status == BannerStatus.loading) return; // ikki marta bosilishni oldini olish

    _status = BannerStatus.loading;
    notifyListeners();

    try {
      final List<BannerModel> fetchedBanners = await _bannerService.getBanners();

      _banners = fetchedBanners;
      _status = BannerStatus.success;
      _errorMessage = '';
    } catch (e) {
      _banners = [];
      _status = BannerStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      
      if (kDebugMode) {
        print('BannerProvider xatolik: $e');
      }
    } finally {
      notifyListeners();
    }
  }

  /// Yangilash (pull-to-refresh uchun)
  Future<void> refresh() async {
    await fetchBanners();
  }

  /// Ma'lumotni tozalash (masalan, logoutda)
  void clear() {
    _banners = [];
    _status = BannerStatus.initial;
    _errorMessage = '';
    notifyListeners();
  }
}