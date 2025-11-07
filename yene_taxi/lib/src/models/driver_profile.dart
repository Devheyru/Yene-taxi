class DriverProfile {
  final String id;
  final String userId;
  final String? vehicleModel;
  final String? plateNumber;
  final String? driverLicenseImage;
  final String status; // pending | approved
  final bool isOnline;
  final GeoPointData? currentLocation;

  const DriverProfile({
    required this.id,
    required this.userId,
    this.vehicleModel,
    this.plateNumber,
    this.driverLicenseImage,
    this.status = 'pending',
    this.isOnline = false,
    this.currentLocation,
  });

  factory DriverProfile.fromJson(Map<String, dynamic> json) => DriverProfile(
    id: json['id'] as String,
    userId: json['userId'] as String,
    vehicleModel: json['vehicleModel'] as String?,
    plateNumber: json['plateNumber'] as String?,
    driverLicenseImage: json['driverLicenseImage'] as String?,
    status: json['status'] as String? ?? 'pending',
    isOnline: json['isOnline'] as bool? ?? false,
    currentLocation:
        json['currentLocation'] != null
            ? GeoPointData.fromJson(
              json['currentLocation'] as Map<String, dynamic>,
            )
            : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'vehicleModel': vehicleModel,
    'plateNumber': plateNumber,
    'driverLicenseImage': driverLicenseImage,
    'status': status,
    'isOnline': isOnline,
    'currentLocation': currentLocation?.toJson(),
  };
}

class GeoPointData {
  final double lat;
  final double lng;
  const GeoPointData({required this.lat, required this.lng});

  factory GeoPointData.fromJson(Map<String, dynamic> json) => GeoPointData(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}
