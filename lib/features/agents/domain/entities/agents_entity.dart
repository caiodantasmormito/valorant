import 'package:equatable/equatable.dart';
import 'package:valorant/features/agents/domain/entities/ability_entity.dart';
import 'package:valorant/features/agents/domain/entities/role_entity.dart';

class AgentsEntity extends Equatable {
  final String id;
  final String displayName;
  final String description;
  final String displayIcon;
  final String fullPortrait;
  final String background;
  final List<String> backgroundGradientColors;
  final RoleEntity role;
  final List<AbilityEntity> abilities;

  const AgentsEntity({
    required this.id,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.role,
    required this.abilities,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
        description,
        displayIcon,
        fullPortrait,
        background,
        backgroundGradientColors,
        role,
        abilities,
      ];
}

class ListAgentsEntity {
  List<AgentsEntity> agents;

  ListAgentsEntity({
    required this.agents,
  });

  @override
  bool operator ==(covariant ListAgentsEntity other) {
    if (identical(this, other)) return true;

    return other.agents == agents;
  }

  @override
  int get hashCode {
    return agents.hashCode;
  }

  // ignore: always_declare_return_types
  where(bool Function(dynamic element) param0) {}
}
