import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/maps/data/datasource/maps_datasource.dart';
import 'package:valorant/features/maps/data/exceptions/exceptions.dart';
import 'package:valorant/features/maps/domain/entities/maps_entity.dart';
import 'package:valorant/features/maps/domain/failures/failures.dart';
import 'package:valorant/features/maps/domain/repositories/maps_repository.dart';

class MapsRepositoryImpl implements MapsRepository {
  final MapsDatasource _mapsDatasource;

  MapsRepositoryImpl({required MapsDatasource mapsDatasource})
      : _mapsDatasource = mapsDatasource;

  @override
  Future<(Failure?, List<MapsEntity>?)> getMaps() async {
    try {
      final result = await _mapsDatasource.getMaps();

      return (null, result.maps);
    } on MapsExeception catch (error) {
      return (
        GetMapsFailure(message: error.message),
        null,
      );
    }
  }
}
