import 'package:equatable/equatable.dart';

class RoleEntity extends Equatable {
  final String id;
  final String displayName;
  final String description;
  final String displayIcon;

  const RoleEntity({
    required this.id,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
        description,
        displayIcon,
      ];
}
