import 'package:flutter/material.dart';

/// MapContainer is a placeholder abstraction for future Google Maps integration.
/// Replace its implementation with a real map (google_maps_flutter or flutter_map)
/// without touching pages that consume it.
class MapContainer extends StatelessWidget {
  final String? label;
  final Widget? overlay;
  const MapContainer({super.key, this.label, this.overlay});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF222831), Color(0xFF393E46)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                label ?? 'Map Placeholder',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (overlay != null) overlay!,
        ],
      ),
    );
  }
}
