// Legacy Freezed file removed. Keeping a stub to prevent import errors.
// Safe to delete once all references are gone.
class _$DriverProfileCopyWithImpl<$Res>
    implements $DriverProfileCopyWith<$Res> {
  _$DriverProfileCopyWithImpl(this._self, this._then);

  final DriverProfile _self;
  final $Res Function(DriverProfile) _then;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleModel = freezed,
    Object? plateNumber = freezed,
    Object? driverLicenseImage = freezed,
    Object? status = null,
    Object? isOnline = null,
    Object? currentLocation = freezed,
  }) {
    return _then(
      _self.copyWith(
        id:
            null == id
                ? _self.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _self.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        vehicleModel:
            freezed == vehicleModel
                ? _self.vehicleModel
                : vehicleModel // ignore: cast_nullable_to_non_nullable
                    as String?,
        plateNumber:
            freezed == plateNumber
                ? _self.plateNumber
                : plateNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        driverLicenseImage:
            freezed == driverLicenseImage
                ? _self.driverLicenseImage
                : driverLicenseImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            null == status
                ? _self.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        isOnline:
            null == isOnline
                ? _self.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentLocation:
            freezed == currentLocation
                ? _self.currentLocation
                : currentLocation // ignore: cast_nullable_to_non_nullable
                    as GeoPointData?,
      ),
    );
  }

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $GeoPointDataCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DriverProfile].
extension DriverProfilePatterns on DriverProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DriverProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DriverProfile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DriverProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DriverProfile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DriverProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DriverProfile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String? vehicleModel,
      String? plateNumber,
      String? driverLicenseImage,
      String status,
      bool isOnline,
      @JsonKey(name: 'currentLocation') GeoPointData? currentLocation,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DriverProfile() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.vehicleModel,
          _that.plateNumber,
          _that.driverLicenseImage,
          _that.status,
          _that.isOnline,
          _that.currentLocation,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String? vehicleModel,
      String? plateNumber,
      String? driverLicenseImage,
      String status,
      bool isOnline,
      @JsonKey(name: 'currentLocation') GeoPointData? currentLocation,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DriverProfile():
        return $default(
          _that.id,
          _that.userId,
          _that.vehicleModel,
          _that.plateNumber,
          _that.driverLicenseImage,
          _that.status,
          _that.isOnline,
          _that.currentLocation,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String? vehicleModel,
      String? plateNumber,
      String? driverLicenseImage,
      String status,
      bool isOnline,
      @JsonKey(name: 'currentLocation') GeoPointData? currentLocation,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DriverProfile() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.vehicleModel,
          _that.plateNumber,
          _that.driverLicenseImage,
          _that.status,
          _that.isOnline,
          _that.currentLocation,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DriverProfile implements DriverProfile {
  const _DriverProfile({
    required this.id,
    required this.userId,
    this.vehicleModel,
    this.plateNumber,
    this.driverLicenseImage,
    this.status = 'pending',
    this.isOnline = false,
    @JsonKey(name: 'currentLocation') this.currentLocation,
  });
  factory _DriverProfile.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? vehicleModel;
  @override
  final String? plateNumber;
  @override
  final String? driverLicenseImage;
  @override
  @JsonKey()
  final String status;
  // pending | approved
  @override
  @JsonKey()
  final bool isOnline;
  @override
  @JsonKey(name: 'currentLocation')
  final GeoPointData? currentLocation;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DriverProfileCopyWith<_DriverProfile> get copyWith =>
      __$DriverProfileCopyWithImpl<_DriverProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DriverProfileToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DriverProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.driverLicenseImage, driverLicenseImage) ||
                other.driverLicenseImage == driverLicenseImage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    vehicleModel,
    plateNumber,
    driverLicenseImage,
    status,
    isOnline,
    currentLocation,
  );

  @override
  String toString() {
    return 'DriverProfile(id: $id, userId: $userId, vehicleModel: $vehicleModel, plateNumber: $plateNumber, driverLicenseImage: $driverLicenseImage, status: $status, isOnline: $isOnline, currentLocation: $currentLocation)';
  }
}

/// @nodoc
abstract mixin class _$DriverProfileCopyWith<$Res>
    implements $DriverProfileCopyWith<$Res> {
  factory _$DriverProfileCopyWith(
    _DriverProfile value,
    $Res Function(_DriverProfile) _then,
  ) = __$DriverProfileCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? vehicleModel,
    String? plateNumber,
    String? driverLicenseImage,
    String status,
    bool isOnline,
    @JsonKey(name: 'currentLocation') GeoPointData? currentLocation,
  });

  @override
  $GeoPointDataCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$DriverProfileCopyWithImpl<$Res>
    implements _$DriverProfileCopyWith<$Res> {
  __$DriverProfileCopyWithImpl(this._self, this._then);

  final _DriverProfile _self;
  final $Res Function(_DriverProfile) _then;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleModel = freezed,
    Object? plateNumber = freezed,
    Object? driverLicenseImage = freezed,
    Object? status = null,
    Object? isOnline = null,
    Object? currentLocation = freezed,
  }) {
    return _then(
      _DriverProfile(
        id:
            null == id
                ? _self.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _self.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        vehicleModel:
            freezed == vehicleModel
                ? _self.vehicleModel
                : vehicleModel // ignore: cast_nullable_to_non_nullable
                    as String?,
        plateNumber:
            freezed == plateNumber
                ? _self.plateNumber
                : plateNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        driverLicenseImage:
            freezed == driverLicenseImage
                ? _self.driverLicenseImage
                : driverLicenseImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            null == status
                ? _self.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        isOnline:
            null == isOnline
                ? _self.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentLocation:
            freezed == currentLocation
                ? _self.currentLocation
                : currentLocation // ignore: cast_nullable_to_non_nullable
                    as GeoPointData?,
      ),
    );
  }

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $GeoPointDataCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }
}

/// @nodoc
mixin _$GeoPointData {
  double get lat;
  double get lng;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<GeoPointData> get copyWith =>
      _$GeoPointDataCopyWithImpl<GeoPointData>(
        this as GeoPointData,
        _$identity,
      );

  /// Serializes this GeoPointData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeoPointData &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'GeoPointData(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $GeoPointDataCopyWith<$Res> {
  factory $GeoPointDataCopyWith(
    GeoPointData value,
    $Res Function(GeoPointData) _then,
  ) = _$GeoPointDataCopyWithImpl;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GeoPointDataCopyWithImpl<$Res> implements $GeoPointDataCopyWith<$Res> {
  _$GeoPointDataCopyWithImpl(this._self, this._then);

  final GeoPointData _self;
  final $Res Function(GeoPointData) _then;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _self.copyWith(
        lat:
            null == lat
                ? _self.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lng:
            null == lng
                ? _self.lng
                : lng // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GeoPointData].
extension GeoPointDataPatterns on GeoPointData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GeoPointData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeoPointData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GeoPointData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoPointData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GeoPointData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoPointData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double lat, double lng)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeoPointData() when $default != null:
        return $default(_that.lat, _that.lng);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double lat, double lng) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoPointData():
        return $default(_that.lat, _that.lng);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double lat, double lng)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoPointData() when $default != null:
        return $default(_that.lat, _that.lng);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GeoPointData implements GeoPointData {
  const _GeoPointData({required this.lat, required this.lng});
  factory _GeoPointData.fromJson(Map<String, dynamic> json) =>
      _$GeoPointDataFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeoPointDataCopyWith<_GeoPointData> get copyWith =>
      __$GeoPointDataCopyWithImpl<_GeoPointData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeoPointDataToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeoPointData &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'GeoPointData(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$GeoPointDataCopyWith<$Res>
    implements $GeoPointDataCopyWith<$Res> {
  factory _$GeoPointDataCopyWith(
    _GeoPointData value,
    $Res Function(_GeoPointData) _then,
  ) = __$GeoPointDataCopyWithImpl;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$GeoPointDataCopyWithImpl<$Res>
    implements _$GeoPointDataCopyWith<$Res> {
  __$GeoPointDataCopyWithImpl(this._self, this._then);

  final _GeoPointData _self;
  final $Res Function(_GeoPointData) _then;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _GeoPointData(
        lat:
            null == lat
                ? _self.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lng:
            null == lng
                ? _self.lng
                : lng // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

// dart format on
