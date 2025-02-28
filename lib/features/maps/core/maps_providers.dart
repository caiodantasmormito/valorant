import 'package:provider/provider.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/maps/data/datasource/maps_datasource.dart';
import 'package:valorant/features/maps/data/datasource/maps_datasource_impl.dart';
import 'package:valorant/features/maps/data/repositories/maps_repository_impl.dart';
import 'package:valorant/features/maps/domain/repositories/maps_repository.dart';
import 'package:valorant/features/maps/domain/usecases/maps_usecase.dart';
import 'package:valorant/features/maps/presentation/cubit/get_maps_cubit.dart';

sealed class MapsInjection {
  static final List<Provider> providers = [
    Provider<MapsDatasource>(
      create: (context) => MapsDatasourceImpl(
        httpClient: context.read<AuthenticatedClient>(),
      ),
    ),
    Provider<MapsRepository>(
      create: (context) =>
          MapsRepositoryImpl(mapsDatasource: context.read<MapsDatasource>()),
    ),
    Provider<MapsUsecase>(
      create: (context) => MapsUsecase(
        mapsRepository: context.read<MapsRepository>(),
      ),
    ),
    Provider<GetMapsCubit>(
      create: (context) => GetMapsCubit(
        getMapsUsecase: context.read<MapsUsecase>(),
      ),
    ),
  ];
}
