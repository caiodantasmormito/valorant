import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/features/maps/domain/usecases/maps_usecase.dart';
import 'package:valorant/features/maps/presentation/cubit/get_maps_cubit.dart';
import 'package:valorant/features/maps/presentation/pages/maps_page.dart';

sealed class MapsRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: MapsPage.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<GetMapsCubit>(
            create: (context) => GetMapsCubit(
              getMapsUsecase: context.read<MapsUsecase>(),
            ),
          ),
        ],
        child: const MapsPage(),
      ),
    ),
  ];
}
