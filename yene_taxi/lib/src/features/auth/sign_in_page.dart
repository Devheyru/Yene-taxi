import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/auth_service.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final repo = ref.watch(authRepositoryProvider);
    final loading = ValueNotifier(false);

    Future<void> signInEmail() async {
      loading.value = true;
      try {
        await repo.signInWithEmail(
          email: emailCtrl.text.trim(),
          password: passCtrl.text,
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        loading.value = false;
      }
    }

    Future<void> google() async {
      loading.value = true;
      try {
        await repo.signInWithGoogle();
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Google error: $e')));
        }
      } finally {
        loading.value = false;
      }
    }

    return ValueListenableBuilder<bool>(
      valueListenable: loading,
      builder: (context, busy, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Sign In')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: busy ? null : signInEmail,
                child: Text(busy ? 'Signing In...' : 'Sign In'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: busy ? null : google,
                child: const Text('Continue with Google'),
              ),
            ],
          ),
        );
      },
    );
  }
}
