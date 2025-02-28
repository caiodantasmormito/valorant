import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/weapons/domain/entities/weapons_entity.dart';
import 'package:valorant/features/weapons/domain/repositories/weapons_repository.dart';

class WeaponsUsecase implements UseCase<List<WeaponsEntity>, NoParams> {
  final WeaponsRepository _weaponsRepository;
  WeaponsUsecase({required WeaponsRepository weaponsRepository})
      : _weaponsRepository = weaponsRepository;

  @override
  Future<(Failure?, List<WeaponsEntity>?)> call(NoParams params) =>
      _weaponsRepository.getWeapons();
}
