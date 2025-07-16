import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Product extends HiveObject {
  @HiveField(0)
  @JsonKey(name: '_id')
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isNew;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final String image;

  @HiveField(7)
  @JsonKey(name: 'oldPrice')
  final String oldPrice;

  @HiveField(8)
  final double discountedPrice;

  @HiveField(9)
  final String category;

  @HiveField(10)
  final String type;

  @HiveField(11)
  final int stock;

  @HiveField(12)
  final String brand;

  @HiveField(13)
  final List<String> size;

  Product({
    required this.id,
    required this.title,
    required this.isNew,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
    required this.oldPrice,
    required this.discountedPrice,
    required this.category,
    required this.type,
    required this.stock,
    required this.brand,
    required this.size,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
