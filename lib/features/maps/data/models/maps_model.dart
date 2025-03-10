import 'package:valorant/features/maps/domain/entities/maps_entity.dart';

class MapsModel extends MapsEntity {
  const MapsModel(
      {required super.description,
      required super.displayName,
      required super.splash,
      required super.displayIcon});

  factory MapsModel.fromMap(Map<String, dynamic> map) {
    return MapsModel(
      description: map['tacticalDescription'] ?? '',
      displayName: map['displayName'],
      splash: map['splash'],
      displayIcon: map['displayIcon'] ?? '',
    );
  }
}

class ListMapsModel extends ListMapsEntity {
  ListMapsModel({
    required super.maps,
  });

  factory ListMapsModel.fromMap(Map<String, dynamic> map) {
    final maps = (map['data'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(MapsModel.fromMap)
        .toList(growable: false);

    return ListMapsModel(
      maps: maps,
    );
  }
}
