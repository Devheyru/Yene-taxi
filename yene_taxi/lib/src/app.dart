import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/sign_in_page.dart';
import 'features/passenger/passenger_home_page.dart';
import 'features/driver/driver_home_page.dart';
import 'features/admin/admin_dashboard_page.dart';
import 'features/auth/role_gate.dart';

class YeneTaxiApp extends ConsumerWidget {
  const YeneTaxiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (ctx, st) => const RoleGate()),
        GoRoute(path: '/sign-in', builder: (ctx, st) => const SignInPage()),
        GoRoute(
          path: '/passenger',
          builder: (ctx, st) => const PassengerHomePage(),
        ),
        GoRoute(path: '/driver', builder: (ctx, st) => const DriverHomePage()),
        GoRoute(
          path: '/admin',
          builder: (ctx, st) => const AdminDashboardPage(),
        ),
      ],
      initialLocation: '/',
      redirect: (context, state) {
        return null; // RoleGate decides.
      },
    );

    return MaterialApp.router(
      title: 'Yene-Taxi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      routerConfig: router,
    );
  }
}
