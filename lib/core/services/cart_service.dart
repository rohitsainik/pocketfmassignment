import 'package:get/get.dart';
import '../../data/repositories/cart_repository.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends GetxController {
  final CartRepository _repository = CartRepository();
  final RxList<CartItem> _items = <CartItem>[].obs;
  final RxDouble _subtotal = 0.0.obs;
  final RxDouble _shipping = 10.0.obs;
  final RxDouble _tax = 0.0.obs;

  List<CartItem> get items => _items;

  double get subtotal => _subtotal.value;

  double get shipping => _shipping.value;

  double get tax => _tax.value;

  double get total => _subtotal.value + _shipping.value + _tax.value;

  @override
  void onInit() async {
    super.onInit();
    await _repository.init();
    _loadCartItems();
  }

  void _loadCartItems() {
    _items.value = _repository.getCartItems();
    _calculateTotals();
  }

  void addToCart(Product product, String size) async {
    await _repository.addToCart(
      CartItem(product: product, quantity: 1, size: size),
    );
    _loadCartItems();
  }

  void addToCartWithSize(Product product, int quantity, String size) async {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );

    if (existingItemIndex != -1) {
      final existingItem = _items[existingItemIndex];
      await _repository.updateQuantity(
        product.id,
        existingItem.quantity + quantity,
        size,
      );
    } else {
      await _repository.addToCart(
        CartItem(product: product, quantity: quantity, size: size),
      );
    }
    _loadCartItems();
  }

  void removeFromCart(int productId) async {
    await _repository.removeFromCart(productId);
    _loadCartItems();
  }

  void updateQuantity(int productId, int quantity, String size) async {
    if (quantity <= 0) {
      await _repository.removeFromCart(productId);
    } else {
      await _repository.updateQuantity(productId, quantity, size);
    }
    _loadCartItems();
  }

  void clearCart() async {
    await _repository.clearCart();
    _loadCartItems();
  }

  void _calculateTotals() {
    _subtotal.value = _items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    _tax.value = _subtotal.value * 0.1; // 10% tax
  }
}
