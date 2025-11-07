import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/services/auth_service.dart';

/// RoleGate listens to the user document stream and redirects outside of build.
/// This avoids build-context-after-async-gap lints and keeps build cheap.
class RoleGate extends ConsumerWidget {
  const RoleGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Per Riverpod's constraint, call ref.listen inside build.
    ref.listen(userDocProvider, (previous, next) {
      next.when(
        data: (user) {
          final router = GoRouter.of(context);
          final target = switch (user?.role) {
            null => '/sign-in',
            'passenger' => '/passenger',
            'driver' => '/driver',
            'admin' => '/admin',
            _ => '/sign-in',
          };
          // Avoid routing if already on target to reduce churn.
          // GoRouter doesn't expose location here; navigate anyway since RoleGate is only at '/'.
          router.go(target);
        },
        error: (_, __) {},
        loading: () {},
      );
    });

    final asyncUser = ref.watch(userDocProvider);
    return asyncUser.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (_) => const SizedBox.shrink(),
    );
  }
}
