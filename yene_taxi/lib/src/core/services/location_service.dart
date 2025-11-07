import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/ride.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final currentLocationProvider = StreamProvider<LocationPoint?>((ref) {
  final svc = ref.watch(locationServiceProvider);
  return svc.location$;
});

class LocationService {
  final _controller = StreamController<LocationPoint?>.broadcast();
  Stream<LocationPoint?> get location$ => _controller.stream;

  LocationService() {
    _init();
  }

  Future<void> _init() async {
    try {
      final has = await _ensurePermission();
      if (!has) {
        _controller.add(null);
        return;
      }
      final pos = await Geolocator.getCurrentPosition();
      _controller.add(LocationPoint(lat: pos.latitude, lng: pos.longitude));
      Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      ).listen((p) {
        _controller.add(LocationPoint(lat: p.latitude, lng: p.longitude));
      });
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('Location init error: $e');
      }
      _controller.add(null);
    }
  }

  Future<bool> _ensurePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
