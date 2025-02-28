import 'package:equatable/equatable.dart';

class MapsEntity extends Equatable {
  final String description;
  final String displayName;

  final String splash;
  final String displayIcon;

  const MapsEntity(
      {required this.description,
      required this.displayName,
      required this.splash,
      required this.displayIcon});

  @override
  List<Object?> get props => [
        description,
        displayName,
        splash,
        displayIcon,
      ];
}

class ListMapsEntity {
  List<MapsEntity> maps;

  ListMapsEntity({
    required this.maps,
  });

  @override
  bool operator ==(covariant ListMapsEntity other) {
    if (identical(this, other)) return true;

    return other.maps == maps;
  }

  @override
  int get hashCode {
    return maps.hashCode;
  }

  // ignore: always_declare_return_types
  where(bool Function(dynamic element) param0) {}
}
