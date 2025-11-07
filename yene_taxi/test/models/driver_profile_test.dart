import 'package:flutter_test/flutter_test.dart';
import 'package:yene_taxi/src/models/driver_profile.dart';

void main() {
  group('DriverProfile serialization', () {
    test('round-trip with location', () {
      final original = DriverProfile(
        id: 'd001',
        userId: 'u123',
        vehicleModel: 'Toyota Corolla',
        plateNumber: 'ABC-123',
        driverLicenseImage: 'http://example.com/license.png',
        status: 'approved',
        isOnline: true,
        currentLocation: const GeoPointData(lat: 8.99, lng: 38.77),
      );
      final json = original.toJson();
      final restored = DriverProfile.fromJson(json);
      expect(restored.id, original.id);
      expect(restored.userId, original.userId);
      expect(restored.vehicleModel, original.vehicleModel);
      expect(restored.plateNumber, original.plateNumber);
      expect(restored.driverLicenseImage, original.driverLicenseImage);
      expect(restored.status, original.status);
      expect(restored.isOnline, original.isOnline);
      expect(restored.currentLocation!.lat, original.currentLocation!.lat);
      expect(restored.currentLocation!.lng, original.currentLocation!.lng);
    });

    test('defaults when optional missing', () {
      final json = {
        'id': 'dX',
        'userId': 'uX',
        // optional fields omitted
      };
      final profile = DriverProfile.fromJson(json);
      expect(profile.id, 'dX');
      expect(profile.userId, 'uX');
      expect(profile.vehicleModel, isNull);
      expect(profile.plateNumber, isNull);
      expect(profile.driverLicenseImage, isNull);
      expect(profile.status, 'pending');
      expect(profile.isOnline, false);
      expect(profile.currentLocation, isNull);
    });
  });
}
