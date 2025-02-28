import 'package:provider/provider.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/weapons/data/datasource/weapons_datasource.dart';
import 'package:valorant/features/weapons/data/datasource/weapons_datasource_impl.dart';
import 'package:valorant/features/weapons/data/repositories/weapons_repository_impl.dart';
import 'package:valorant/features/weapons/domain/repositories/weapons_repository.dart';
import 'package:valorant/features/weapons/domain/usecase/usecase.dart';
import 'package:valorant/features/weapons/presentation/cubit/get_weapons_cubit.dart';

sealed class WeaponsInjection {
  static final List<Provider> providers = [
    Provider<WeaponsDatasource>(
      create: (context) => WeaponsDatasourceImpl(
        httpClient: context.read<AuthenticatedClient>(),
      ),
    ),
    Provider<WeaponsRepository>(
      create: (context) => WeaponsRepositoryImpl(
          weaponsDatasource: context.read<WeaponsDatasource>()),
    ),
    Provider<WeaponsUsecase>(
      create: (context) => WeaponsUsecase(
        weaponsRepository: context.read<WeaponsRepository>(),
      ),
    ),
    Provider<GetWeaponsCubit>(
      create: (context) => GetWeaponsCubit(
        getWeaponsUsecase: context.read<WeaponsUsecase>(),
      ),
    ),
  ];
}
