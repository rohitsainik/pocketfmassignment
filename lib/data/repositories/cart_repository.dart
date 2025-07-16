import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/models/cart_item.dart';
import '../../core/models/product.dart';

class CartRepository {
  static const String cartBoxName = 'cart';
  late Box<CartItem> _cartBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ProductAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CartItemAdapter());
    }
    
    _cartBox = await Hive.openBox<CartItem>(cartBoxName);
  }

  Future<void> addToCart(CartItem item) async {
    final existingItemIndex = _cartBox.values.toList().indexWhere(
          (element) => element.product.id == item.product.id && element.size == item.size,
        );

    if (existingItemIndex != -1) {
      final existingItem = _cartBox.getAt(existingItemIndex)!;
      await _cartBox.putAt(
        existingItemIndex,
        CartItem(
          product: item.product,
          quantity: existingItem.quantity + 1,
          size: item.size,
        ),
      );
    } else {
      await _cartBox.add(item);
    }
  }

  Future<void> updateQuantity(int productId, int quantity, String size) async {
    final index = _cartBox.values.toList().indexWhere(
          (element) => element.product.id == productId && element.size == size,
        );
    if (index != -1) {
      final item = _cartBox.getAt(index)!;
      await _cartBox.putAt(
        index,
        CartItem(
          product: item.product,
          quantity: quantity,
          size: size,
        ),
      );
    }
  }

  Future<void> removeFromCart(int productId) async {
    final index = _cartBox.values.toList().indexWhere(
          (element) => element.product.id == productId,
        );
    if (index != -1) {
      await _cartBox.deleteAt(index);
    }
  }


  Future<void> clearCart() async {
    await _cartBox.clear();
  }

  List<CartItem> getCartItems() {
    return _cartBox.values.toList();
  }
}