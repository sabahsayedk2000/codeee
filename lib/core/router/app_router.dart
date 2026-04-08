import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_portal_training_management/features/admin/presentation/screens/admin_dashboard_screen.dart';
import 'package:multi_portal_training_management/features/auth/application/auth_controller.dart';
import 'package:multi_portal_training_management/features/auth/presentation/screens/login_screen.dart';
import 'package:multi_portal_training_management/features/school/presentation/screens/school_dashboard_screen.dart';
import 'package:multi_portal_training_management/features/trainer/presentation/screens/trainer_dashboard_screen.dart';
import 'package:multi_portal_training_management/features/walkro/presentation/screens/walkro_dashboard_screen.dart';
import 'package:multi_portal_training_management/shared/models/app_user.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/admin', builder: (context, state) => const AdminDashboardScreen()),
      GoRoute(path: '/walkro', builder: (context, state) => const WalkroDashboardScreen()),
      GoRoute(path: '/trainer', builder: (context, state) => const TrainerDashboardScreen()),
      GoRoute(path: '/school', builder: (context, state) => const SchoolDashboardScreen()),
    ],
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);
      final user = authState.valueOrNull;
      final onLogin = state.matchedLocation == '/login';

      if (user == null) {
        return onLogin ? null : '/login';
      }
      if (onLogin) {
        return _routeForRole(user.role);
      }
      return null;
    },
  );
});

String _routeForRole(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return '/admin';
    case UserRole.walkro:
      return '/walkro';
    case UserRole.trainer:
      return '/trainer';
    case UserRole.school:
      return '/school';
    case UserRole.unknown:
      return '/login';
  }
}
