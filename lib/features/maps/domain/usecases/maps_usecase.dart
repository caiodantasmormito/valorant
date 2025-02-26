import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/maps/domain/entities/maps_entity.dart';
import 'package:valorant/features/maps/domain/repositories/maps_repository.dart';

class MapsUsecase implements UseCase<List<MapsEntity>, NoParams> {
  final MapsRepository _mapsRepository;
  MapsUsecase({required MapsRepository mapsRepository})
      : _mapsRepository = mapsRepository;

  @override
  Future<(Failure?, List<MapsEntity>?)> call(NoParams params) =>
      _mapsRepository.getMaps();
}
