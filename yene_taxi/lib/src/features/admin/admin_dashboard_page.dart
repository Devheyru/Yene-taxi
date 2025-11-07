import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/repositories/driver_repository.dart';

class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingAsync = ref.watch(pendingDriversProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          pendingAsync.when(
            loading: () => const _Card(title: 'Pending Drivers (loading)'),
            error: (e, st) => _Card(title: 'Pending Drivers (error)'),
            data:
                (drivers) => _Card(
                  title: 'Pending Drivers (${drivers.length})',
                  child: ListView.builder(
                    itemCount: drivers.length,
                    itemBuilder: (c, i) {
                      final d = drivers[i];
                      return ListTile(
                        title: Text(d.userId),
                        subtitle: Text(d.vehicleModel ?? 'No vehicle'),
                        trailing: IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () async {
                            await ref
                                .read(driverRepositoryProvider)
                                .approve(d.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
          ),
          const _Card(title: 'All Rides'),
          const _Card(title: 'Earnings Analytics'),
          const _Card(title: 'Users & Bans'),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final Widget? child;
  const _Card({required this.title, this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Expanded(child: child ?? const Center(child: Text('Coming Soon'))),
          ],
        ),
      ),
    );
  }
}
