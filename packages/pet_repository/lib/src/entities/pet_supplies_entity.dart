import 'package:pet_repository/src/entities/macros_entity.dart';
import 'package:pet_repository/src/models/macros.dart';

class ItemEntity {
  String itemId;
  String picture;
  String name;
  String description;
  String itemGroup;
  String petGroup;
  int price;
  int discount;
  Macros macros;

  ItemEntity({
    required this.itemId,
    required this.picture,
    required this.name,
    required this.description,
    required this.itemGroup,
    required this.petGroup,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'itemId': itemId,
      'picture': picture,
      'name': name,
      'description': description,
      'itemGroup': itemGroup,
      'petGroup': petGroup,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static ItemEntity fromDocument(Map<String, dynamic> doc) {
    return ItemEntity(
        itemId: doc['itemId'],
        picture: doc['picture'],
        name: doc['name'],
        description: doc['description'],
        itemGroup: doc['itemGroup'],
        petGroup: doc['petGroup'],
        price:
            doc['price'] is int ? doc['price'] : (doc['price'] as num).toInt(),
        discount: doc['discount'] is int
            ? doc['discount']
            : (doc['discount'] as num).toInt(),
        macros: Macros.fromEntity(
            MacrosEntity.fromDocument(doc['macros'] as Map<String, dynamic>)));
  }
}
