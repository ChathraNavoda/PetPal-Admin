import 'package:pet_repository/src/entities/pet_supplies_entity.dart';
import 'package:pet_repository/src/models/macros.dart';
import 'package:uuid/uuid.dart';

class Item {
  String itemId;
  String picture;
  String name;
  String description;
  String itemGroup;
  String petGroup;
  int price;
  int discount;
  Macros macros;

  Item({
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

  static final empty = Item(
      itemId: const Uuid().v1(),
      picture: '',
      name: '',
      description: '',
      itemGroup: '',
      petGroup: '',
      price: 30,
      discount: 10,
      macros: Macros.empty);

  ItemEntity toEntity() {
    return ItemEntity(
      itemId: itemId,
      picture: picture,
      name: name,
      description: description,
      price: price,
      discount: discount,
      macros: macros,
      itemGroup: itemGroup,
      petGroup: petGroup,
    );
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      itemId: entity.itemId,
      picture: entity.picture,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      macros: entity.macros,
      itemGroup: entity.itemGroup,
      petGroup: entity.petGroup,
    );
  }
}
