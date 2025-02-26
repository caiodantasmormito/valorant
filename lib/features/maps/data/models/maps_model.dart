import 'package:valorant/features/maps/domain/entities/maps_entity.dart';

class MapsModel extends MapsEntity {
  const MapsModel(
      {required super.id, required super.displayName, required super.splash});

  factory MapsModel.fromMap(Map<String, dynamic> map) {
    return MapsModel(
      id: map['uuid'],
      displayName: map['displayName'],
      splash: map['splash'],
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
