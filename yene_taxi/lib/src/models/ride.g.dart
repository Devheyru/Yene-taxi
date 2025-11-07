// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ride _$RideFromJson(Map<String, dynamic> json) => _Ride(
  id: json['id'] as String,
  passengerId: json['passengerId'] as String,
  driverId: json['driverId'] as String?,
  pickup: LocationPoint.fromJson(json['pickup'] as Map<String, dynamic>),
  dropoff: LocationPoint.fromJson(json['dropoff'] as Map<String, dynamic>),
  fare: (json['fare'] as num?)?.toDouble(),
  status: json['status'] as String? ?? 'searching',
);

Map<String, dynamic> _$RideToJson(_Ride instance) => <String, dynamic>{
  'id': instance.id,
  'passengerId': instance.passengerId,
  'driverId': instance.driverId,
  'pickup': instance.pickup,
  'dropoff': instance.dropoff,
  'fare': instance.fare,
  'status': instance.status,
};

_LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) =>
    _LocationPoint(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationPointToJson(_LocationPoint instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
