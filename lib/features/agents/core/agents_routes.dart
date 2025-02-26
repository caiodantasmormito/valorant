import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/features/agents/domain/usecases/agents_usecase.dart';
import 'package:valorant/features/agents/presentation/cubit/get_agents_cubit.dart';
import 'package:valorant/features/agents/presentation/pages/agents_page.dart';

sealed class AgentsRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: AgentsPage.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<GetAgentsCubit>(
            create: (context) => GetAgentsCubit(
              getAgentsUsecase: context.read<AgentsUsecase>(),
            ),
          ),
        ],
        child: const AgentsPage(),
      ),
    ),
  ];
}
