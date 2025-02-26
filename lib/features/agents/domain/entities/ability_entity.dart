import 'package:equatable/equatable.dart';

class AbilityEntity extends Equatable {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  const AbilityEntity({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  @override
  List<Object?> get props => [
        slot,
        displayName,
        description,
        displayIcon,
      ];
}
