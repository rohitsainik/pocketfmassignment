// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      title: fields[1] as String,
      isNew: fields[2] as bool,
      description: fields[3] as String,
      price: fields[4] as double,
      rating: fields[5] as double,
      image: fields[6] as String,
      oldPrice: fields[7] as String,
      discountedPrice: fields[8] as double,
      category: fields[9] as String,
      type: fields[10] as String,
      stock: fields[11] as int,
      brand: fields[12] as String,
      size: (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isNew)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.oldPrice)
      ..writeByte(8)
      ..write(obj.discountedPrice)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.stock)
      ..writeByte(12)
      ..write(obj.brand)
      ..writeByte(13)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['_id'] as num).toInt(),
      title: json['title'] as String,
      isNew: json['isNew'] as bool,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      oldPrice: json['oldPrice'] as String,
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      category: json['category'] as String,
      type: json['type'] as String,
      stock: (json['stock'] as num).toInt(),
      brand: json['brand'] as String,
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isNew': instance.isNew,
      'description': instance.description,
      'price': instance.price,
      'rating': instance.rating,
      'image': instance.image,
      'oldPrice': instance.oldPrice,
      'discountedPrice': instance.discountedPrice,
      'category': instance.category,
      'type': instance.type,
      'stock': instance.stock,
      'brand': instance.brand,
      'size': instance.size,
    };
