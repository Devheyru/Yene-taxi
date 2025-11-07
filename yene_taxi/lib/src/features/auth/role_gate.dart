import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/services/auth_service.dart';

/// RoleGate listens to the user document stream and redirects outside of build.
/// This avoids build-context-after-async-gap lints and keeps build cheap.
class RoleGate extends ConsumerStatefulWidget {
  const RoleGate({super.key});

  @override
  ConsumerState<RoleGate> createState() => _RoleGateState();
}

class _RoleGateState extends ConsumerState<RoleGate> {
  @override
  void initState() {
    super.initState();
    // Listen for user changes and navigate accordingly.
    ref.listen(userDocProvider, (previous, next) {
      if (!mounted) return;
      next.when(
        data: (user) {
          final router = GoRouter.of(context);
          String target;
          if (user == null) {
            target = '/sign-in';
          } else {
            target = switch (user.role) {
              'passenger' => '/passenger',
              'driver' => '/driver',
              'admin' => '/admin',
              _ => '/sign-in',
            };
          }
          router.go(target);
        },
        error: (_, __) {},
        loading: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(userDocProvider);
    return asyncUser.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (user) {
        // Navigation handled by listener; render minimal placeholder.
        return const SizedBox.shrink();
      },
    );
  }
}
