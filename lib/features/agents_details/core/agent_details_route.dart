import 'package:go_router/go_router.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';
import 'package:valorant/features/agents_details/presentation/pages/agent_details_page.dart';

sealed class AgentDetailsRoute {
  static final List<RouteBase> routes = [
    GoRoute(
        path: DetailScreen.routeName,
        builder: (context, state) {
          final agent = state.extra as AgentsEntity;
          return DetailScreen(agent: agent);
        }),
  ];
}
