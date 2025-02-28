import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/weapons/domain/entities/weapons_entity.dart';

abstract class WeaponsRepository {
  Future<(Failure?, List<WeaponsEntity>?)> getWeapons();
}
