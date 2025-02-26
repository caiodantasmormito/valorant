import 'package:valorant/features/agents/domain/entities/ability_entity.dart';

class AbilityModel extends AbilityEntity {
  const AbilityModel(
      {required super.slot,
      required super.displayName,
      required super.description,
      required super.displayIcon});

  factory AbilityModel.fromMap(Map<String, dynamic> map) {
    return AbilityModel(
      slot: map['slot'],
      displayName: map['displayName'],
      description: map['description'],
      displayIcon: map['displayIcon'] ?? '',
    );
  }
}
