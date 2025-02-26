import 'package:valorant/features/agents/domain/entities/role_entity.dart';

class RoleModel extends RoleEntity {
  const RoleModel({
    required super.id,
    required super.displayName,
    required super.description,
    required super.displayIcon,
  });

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['uuid'],
      displayName: map['displayName'],
      description: map['description'],
      displayIcon: map['displayIcon'],
    );
  }
}
