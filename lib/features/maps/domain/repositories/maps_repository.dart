import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/maps/domain/entities/maps_entity.dart';

abstract class MapsRepository {
  Future<(Failure?, List<MapsEntity>?)> getMaps();
}
