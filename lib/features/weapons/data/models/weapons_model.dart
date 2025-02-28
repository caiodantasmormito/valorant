import 'package:valorant/features/weapons/domain/entities/weapons_entity.dart';

class WeaponsModel extends WeaponsEntity {
  const WeaponsModel({
    required super.displayName,
    required super.displayIcon,
  });

  factory WeaponsModel.fromMap(Map<String, dynamic> map) {
    return WeaponsModel(
      displayName: map['displayName'],
      displayIcon: map['displayIcon'],
    );
  }
}

class ListWeaponsModel extends ListWeaponsEntity {
  ListWeaponsModel({
    required super.weapons,
  });

  factory ListWeaponsModel.fromMap(Map<String, dynamic> map) {
    final weapons = (map['data'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(WeaponsModel.fromMap)
        .toList(growable: false);

    return ListWeaponsModel(
      weapons: weapons,
    );
  }
}
