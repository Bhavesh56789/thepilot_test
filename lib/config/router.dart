import 'package:go_router/go_router.dart';
import 'package:thepilot_test/features/assigned_class/view/assigned_class.view.dart';
import 'package:thepilot_test/features/auth/view/login.view.dart';
import 'package:thepilot_test/features/home/view/home.view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: LoginScreen.route,
  routes: [
    GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: HomeScreen.route,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: AssignedClassScreen.route,
          builder: (context, state) => AssignedClassScreen(),
        ),
      ],
    ),
  ],
);
