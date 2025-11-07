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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                ),
              ),
            ),
            if (label != null)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    label!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            if (overlay != null) overlay!,
          ],
        ),
      ),
    );
  }
}
