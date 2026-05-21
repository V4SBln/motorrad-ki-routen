import 'package:go_router/go_router.dart';
import '../features/route_planner/presentation/screens/route_planner_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const RoutePlannerScreen()),
  ],
);
