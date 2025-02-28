import 'package:equatable/equatable.dart';

class WeaponsEntity extends Equatable {
  final String displayName;

  final String displayIcon;

  const WeaponsEntity({
    required this.displayName,
    required this.displayIcon,
  });

  @override
  List<Object?> get props => [
        displayName,
        displayIcon,
      ];
}

class ListWeaponsEntity {
  List<WeaponsEntity> weapons;

  ListWeaponsEntity({
    required this.weapons,
  });

  @override
  bool operator ==(covariant ListWeaponsEntity other) {
    if (identical(this, other)) return true;

    return other.weapons == weapons;
  }

  @override
  int get hashCode {
    return weapons.hashCode;
  }

  // ignore: always_declare_return_types
  where(bool Function(dynamic element) param0) {}
}
