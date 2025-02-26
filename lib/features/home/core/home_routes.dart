import 'package:go_router/go_router.dart';
import 'package:valorant/features/home/presentation/pages/home_page.dart';

sealed class HomeRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
  ];
}
