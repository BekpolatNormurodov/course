import '../../config/dio_client.dart';
import 'cart_model.dart';

class CartService {
  final _dio = DioClient.instance;

  // Savat itemlarini olish
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final response = await _dio.get('/cart');
      final data = response.data;
      final List items = data is List ? data : (data['data'] ?? []);

      return items
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Savat ma\'lumotlari yuklanmadi: $e');
    }
  }

  // Savatga kurs qo'shish
  Future<CartItemModel> addToCart(int courseId) async {
    try {
      final response = await _dio.post('/cart', data: {'courseId': courseId});
      return CartItemModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Savatga qo\'shish amalga oshmadi: $e');
    }
  }
  

  // Savatdan o'chirish
  Future<void> removeFromCart(int cartItemId) async {
    try {
      await _dio.delete('/cart/$cartItemId');
    } catch (e) {
      throw Exception('Savatdan o\'chirish amalga oshmadi: $e');
    }
  }

  // Savatni tozalash
  Future<void> clearCart() async {
    try {
      await _dio.delete('/cart/clear');
    } catch (e) {
      throw Exception('Savatni tozalash amalga oshmadi: $e');
    }
  }
}
