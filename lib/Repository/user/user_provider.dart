import 'package:flutter/foundation.dart';
import 'user_model.dart';
import 'user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load user data from API
  Future<void> loadUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _userService.getMe();
    } catch (e) {
      _error = e.toString();
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user data
  Future<bool> updateUser({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? birthDate,
    String? gender,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _userService.updateMe(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        gender: gender,
      );

      // Reload user data after update
      await loadUser();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Upload profile image
  Future<bool> uploadImage(String imagePath) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedUser = await _userService.uploadImage(imagePath);
      _user = updatedUser;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear user data (for logout)
  void clearUser() {
    _user = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
