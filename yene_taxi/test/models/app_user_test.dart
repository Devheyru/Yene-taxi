import 'package:flutter_test/flutter_test.dart';
import 'package:yene_taxi/src/models/user_model.dart';

void main() {
  group('AppUser serialization', () {
    test('round-trip with all fields', () {
      final original = AppUser(
        id: 'u123',
        email: 'user@example.com',
        name: 'Test User',
        photoUrl: 'http://example.com/pic.png',
        phone: '+1234567890',
        role: 'passenger',
      );
      final json = original.toJson();
      final restored = AppUser.fromJson(json);
      expect(restored.id, original.id);
      expect(restored.email, original.email);
      expect(restored.name, original.name);
      expect(restored.photoUrl, original.photoUrl);
      expect(restored.phone, original.phone);
      expect(restored.role, original.role);
    });

    test('missing optional fields default correctly', () {
      final json = {
        'id': 'u999',
        'email': 'noopts@example.com',
        // name, photoUrl, phone omitted
        // role omitted -> should default passenger
      };
      final user = AppUser.fromJson(json);
      expect(user.id, 'u999');
      expect(user.email, 'noopts@example.com');
      expect(user.name, isNull);
      expect(user.photoUrl, isNull);
      expect(user.phone, isNull);
      expect(user.role, 'passenger');
    });
  });
}
