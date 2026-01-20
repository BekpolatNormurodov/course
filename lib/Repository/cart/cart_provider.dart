import 'package:flutter/foundation.dart';
import 'cart_model.dart';
import 'cart_service.dart';

enum CartStatus { initial, loading, success, error }

class CartProvider extends ChangeNotifier {
  CartStatus _status = CartStatus.initial;
  CartStatus get status => _status;

  List<CartItemModel> _cartItems = [];
  List<CartItemModel> get cartItems => _cartItems;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool get isLoading => _status == CartStatus.loading;
  bool get isSuccess => _status == CartStatus.success;
  bool get hasError => _status == CartStatus.error;
  bool get hasData => _cartItems.isNotEmpty;
  int get itemCount => _cartItems.length;

  // Total price calculator
  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.price ?? 0.0));
  }

  final CartService _cartService = CartService();

  /// Savat itemlarini yuklash
  Future<void> fetchCartItems() async {
    if (_status == CartStatus.loading) return; // ikki marta bosilishni oldini olish

    _status = CartStatus.loading;
    notifyListeners();

    try {
      final List<CartItemModel> fetchedItems = await _cartService.getCartItems();

      _cartItems = fetchedItems;
      _status = CartStatus.success;
      _errorMessage = '';
    } catch (e) {
      _cartItems = [];
      _status = CartStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');

      if (kDebugMode) {
        print('CartProvider xatolik: $e');
      }
    } finally {
      notifyListeners();
    }
  }

  /// Savatga kurs qo'shish
  Future<bool> addToCart(int courseId) async {
    try {
      _status = CartStatus.loading;
      notifyListeners();

      final newItem = await _cartService.addToCart(courseId);
      _cartItems.add(newItem);

      _status = CartStatus.success;
      _errorMessage = '';
      notifyListeners();
      return true;
    } catch (e) {
      _status = CartStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();

      if (kDebugMode) {
        print('CartProvider addToCart xatolik: $e');
      }
      return false;
    }
  }

  /// Savatdan o'chirish
  Future<bool> removeFromCart(int cartItemId) async {
    try {
      await _cartService.removeFromCart(cartItemId);

      // Remove from local list
      _cartItems.removeWhere((item) => item.id == cartItemId);

      _errorMessage = '';
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();

      if (kDebugMode) {
        print('CartProvider removeFromCart xatolik: $e');
      }
      return false;
    }
  }

  /// Savatni tozalash
  Future<bool> clearCart() async {
    try {
      _status = CartStatus.loading;
      notifyListeners();

      await _cartService.clearCart();
      _cartItems.clear();

      _status = CartStatus.success;
      _errorMessage = '';
      notifyListeners();
      return true;
    } catch (e) {
      _status = CartStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();

      if (kDebugMode) {
        print('CartProvider clearCart xatolik: $e');
      }
      return false;
    }
  }

  /// Yangilash (pull-to-refresh uchun)
  Future<void> refresh() async {
    await fetchCartItems();
  }

  /// Ma'lumotni tozalash (masalan, logoutda)
  void clear() {
    _cartItems = [];
    _status = CartStatus.initial;
    _errorMessage = '';
    notifyListeners();
  }

  /// Check if course is already in cart
  bool isInCart(int courseId) {
    return _cartItems.any((item) => item.courseId == courseId);
  }
}
