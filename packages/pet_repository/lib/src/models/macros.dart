import '../entities/macros_entity.dart';

class Macros {
  int weight;
  int length;
  int width;

  Macros({
    required this.weight,
    required this.length,
    required this.width,
  });

  static final empty = Macros(
    weight: 0,
    length: 0,
    width: 0,
  );

  MacrosEntity toEntity() {
    return MacrosEntity(
      weight: weight,
      length: length,
      width: width,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
      weight: entity.weight,
      length: entity.length,
      width: entity.width,
    );
  }
}
