import 'package:flutter_test/flutter_test.dart';
import 'package:yene_taxi/src/models/ride.dart';

void main() {
  test('Ride model json roundtrip', () {
    final ride = Ride(
      id: 'r1',
      passengerId: 'p1',
      pickup: const LocationPoint(lat: 1.23, lng: 4.56, address: 'A'),
      dropoff: const LocationPoint(lat: 7.89, lng: 0.12, address: 'B'),
      status: 'searching',
    );
    final json = ride.toJson();
    final back = Ride.fromJson(json);
    expect(back.id, ride.id);
    expect(back.passengerId, ride.passengerId);
    expect(back.pickup.lat, ride.pickup.lat);
    expect(back.dropoff.address, ride.dropoff.address);
    expect(back.status, 'searching');
  });
}
