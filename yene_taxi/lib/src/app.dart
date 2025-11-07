import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/sign_in_page.dart';
import 'features/auth/sign_up_page.dart';
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
        GoRoute(path: '/sign-up', builder: (ctx, st) => const SignUpPage()),
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

    final baseScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Yene-Taxi',
      theme: ThemeData(
        colorScheme: baseScheme,
        scaffoldBackgroundColor: baseScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: baseScheme.primary,
          foregroundColor: baseScheme.onPrimary,
          elevation: 1,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: baseScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: baseScheme.primary.withValues(alpha: .4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: baseScheme.primary.withValues(alpha: .3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: baseScheme.primary, width: 1.6),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: baseScheme.primary,
            foregroundColor: baseScheme.onPrimary,
            minimumSize: const Size(160, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: baseScheme.primary,
            side: BorderSide(color: baseScheme.primary),
            minimumSize: const Size(160, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: baseScheme.surface,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
          bodyColor: baseScheme.onSurface,
          displayColor: baseScheme.onSurface,
        ),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
    );
  }
}
