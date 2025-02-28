import 'package:go_router/go_router.dart';
import 'package:valorant/features/agents/core/agents_routes.dart';
import 'package:valorant/features/agents_details/core/agent_details_route.dart';
import 'package:valorant/features/home/core/home_routes.dart';
import 'package:valorant/features/maps/core/maps_routes.dart';
import 'package:valorant/features/weapons/core/weapons_routes.dart';

final router = GoRouter(
  routes: [
    ...AgentsRoutes.routes,
    ...HomeRoutes.routes,
    ...AgentDetailsRoute.routes,
    ...MapsRoutes.routes,
    ...WeaponsRoutes.routes,
  ],
);
