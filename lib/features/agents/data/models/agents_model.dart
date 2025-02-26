import 'package:valorant/features/agents/data/models/ability_model.dart';
import 'package:valorant/features/agents/data/models/role_model.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';

class AgentsModel extends AgentsEntity {
  const AgentsModel(
      {required super.id,
      required super.displayName,
      required super.description,
      required super.displayIcon,
      required super.fullPortrait,
      required super.background,
      required super.backgroundGradientColors,
      super.role,
      required super.abilities});

  factory AgentsModel.fromMap(Map<String, dynamic> map) {
    final roleMap = map['role'] as Map<String, dynamic>?;
    final role = roleMap != null ? RoleModel.fromMap(roleMap) : null;

    final abilities = (map['abilities'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(AbilityModel.fromMap)
        .toList();
    final backgroundGradientColors =
        (map['backgroundGradientColors'] as List).cast<String>();

    return AgentsModel(
      id: map['uuid'],
      displayName: map['displayName'],
      description: map['description'],
      displayIcon: map['displayIcon'],
      fullPortrait: map['fullPortrait'] ?? '',
      background: map['background'] ?? '',
      backgroundGradientColors: backgroundGradientColors,
      role: role,
      abilities: abilities,
    );
  }
}

class ListAgentsModel extends ListAgentsEntity {
  ListAgentsModel({
    required super.agents,
  });

  factory ListAgentsModel.fromMap(Map<String, dynamic> map) {
    final agents = (map['data'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(AgentsModel.fromMap)
        .toList(growable: false);

    return ListAgentsModel(
      agents: agents,
    );
  }
}
