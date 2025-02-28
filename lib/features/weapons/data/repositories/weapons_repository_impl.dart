import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/agents/data/exceptions/exceptions.dart';
import 'package:valorant/features/agents/domain/failures/failures.dart';
import 'package:valorant/features/weapons/data/datasource/weapons_datasource.dart';
import 'package:valorant/features/weapons/domain/entities/weapons_entity.dart';
import 'package:valorant/features/weapons/domain/repositories/weapons_repository.dart';

class WeaponsRepositoryImpl implements WeaponsRepository {
  final WeaponsDatasource _weaponsDatasource;

  WeaponsRepositoryImpl({required WeaponsDatasource weaponsDatasource})
      : _weaponsDatasource = weaponsDatasource;

  @override
  Future<(Failure?, List<WeaponsEntity>?)> getWeapons() async {
    try {
      final result = await _weaponsDatasource.getWeapons();

      return (null, result.weapons);
    } on AgentsExeception catch (error) {
      return (
        GetAgentsFailure(message: error.message),
        null,
      );
    }
  }
}
