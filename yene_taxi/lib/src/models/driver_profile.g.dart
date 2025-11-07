// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverProfile _$DriverProfileFromJson(Map<String, dynamic> json) =>
    _DriverProfile(
      id: json['id'] as String,
      userId: json['userId'] as String,
      vehicleModel: json['vehicleModel'] as String?,
      plateNumber: json['plateNumber'] as String?,
      driverLicenseImage: json['driverLicenseImage'] as String?,
      status: json['status'] as String? ?? 'pending',
      isOnline: json['isOnline'] as bool? ?? false,
      currentLocation:
          json['currentLocation'] == null
              ? null
              : GeoPointData.fromJson(
                json['currentLocation'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$DriverProfileToJson(_DriverProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'vehicleModel': instance.vehicleModel,
      'plateNumber': instance.plateNumber,
      'driverLicenseImage': instance.driverLicenseImage,
      'status': instance.status,
      'isOnline': instance.isOnline,
      'currentLocation': instance.currentLocation,
    };

_GeoPointData _$GeoPointDataFromJson(Map<String, dynamic> json) =>
    _GeoPointData(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoPointDataToJson(_GeoPointData instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
