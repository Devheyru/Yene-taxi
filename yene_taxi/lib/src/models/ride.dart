class Ride {
  final String id;
  final String passengerId;
  final String? driverId;
  final LocationPoint pickup;
  final LocationPoint dropoff;
  final double? fare;
  final String status; // searching | assigned | onTrip | completed

  const Ride({
    required this.id,
    required this.passengerId,
    this.driverId,
    required this.pickup,
    required this.dropoff,
    this.fare,
    this.status = 'searching',
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json['id'] as String,
    passengerId: json['passengerId'] as String,
    driverId: json['driverId'] as String?,
    pickup: LocationPoint.fromJson(json['pickup'] as Map<String, dynamic>),
    dropoff: LocationPoint.fromJson(json['dropoff'] as Map<String, dynamic>),
    fare: (json['fare'] as num?)?.toDouble(),
    status: json['status'] as String? ?? 'searching',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'passengerId': passengerId,
    'driverId': driverId,
    'pickup': pickup.toJson(),
    'dropoff': dropoff.toJson(),
    'fare': fare,
    'status': status,
  };
}

class LocationPoint {
  final double lat;
  final double lng;
  final String? address;
  const LocationPoint({required this.lat, required this.lng, this.address});

  factory LocationPoint.fromJson(Map<String, dynamic> json) => LocationPoint(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    address: json['address'] as String?,
  );
  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng, 'address': address};
}
