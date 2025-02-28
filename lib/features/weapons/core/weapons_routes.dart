import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/features/weapons/domain/usecase/usecase.dart';
import 'package:valorant/features/weapons/presentation/cubit/get_weapons_cubit.dart';
import 'package:valorant/features/weapons/presentation/pages/weapons_page.dart';

sealed class WeaponsRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: WeaponsPage.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<GetWeaponsCubit>(
            create: (context) => GetWeaponsCubit(
              getWeaponsUsecase: context.read<WeaponsUsecase>(),
            ),
          ),
        ],
        child: const WeaponsPage(),
      ),
    ),
  ];
}
