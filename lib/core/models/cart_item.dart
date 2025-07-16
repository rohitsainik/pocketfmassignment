import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CartItem extends HiveObject {
  @HiveField(0)
  final Product product;

  @HiveField(1)
  final int quantity;

  @HiveField(2)
  final String size;

  CartItem({
    required this.product,
    required this.quantity,
    required this.size,
  });

  double get total => product.price * quantity;

  CartItem copyWith({int? quantity, String? size}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
