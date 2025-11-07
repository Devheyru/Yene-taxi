// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ride {

 String get id; String get passengerId; String? get driverId; LocationPoint get pickup; LocationPoint get dropoff; double? get fare; String get status;
/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RideCopyWith<Ride> get copyWith => _$RideCopyWithImpl<Ride>(this as Ride, _$identity);

  /// Serializes this Ride to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ride&&(identical(other.id, id) || other.id == id)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.dropoff, dropoff) || other.dropoff == dropoff)&&(identical(other.fare, fare) || other.fare == fare)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,passengerId,driverId,pickup,dropoff,fare,status);

@override
String toString() {
  return 'Ride(id: $id, passengerId: $passengerId, driverId: $driverId, pickup: $pickup, dropoff: $dropoff, fare: $fare, status: $status)';
}


}

/// @nodoc
abstract mixin class $RideCopyWith<$Res>  {
  factory $RideCopyWith(Ride value, $Res Function(Ride) _then) = _$RideCopyWithImpl;
@useResult
$Res call({
 String id, String passengerId, String? driverId, LocationPoint pickup, LocationPoint dropoff, double? fare, String status
});


$LocationPointCopyWith<$Res> get pickup;$LocationPointCopyWith<$Res> get dropoff;

}
/// @nodoc
class _$RideCopyWithImpl<$Res>
    implements $RideCopyWith<$Res> {
  _$RideCopyWithImpl(this._self, this._then);

  final Ride _self;
  final $Res Function(Ride) _then;

/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? passengerId = null,Object? driverId = freezed,Object? pickup = null,Object? dropoff = null,Object? fare = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,passengerId: null == passengerId ? _self.passengerId : passengerId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as LocationPoint,dropoff: null == dropoff ? _self.dropoff : dropoff // ignore: cast_nullable_to_non_nullable
as LocationPoint,fare: freezed == fare ? _self.fare : fare // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get pickup {
  
  return $LocationPointCopyWith<$Res>(_self.pickup, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get dropoff {
  
  return $LocationPointCopyWith<$Res>(_self.dropoff, (value) {
    return _then(_self.copyWith(dropoff: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ride].
extension RidePatterns on Ride {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ride value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ride() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ride value)  $default,){
final _that = this;
switch (_that) {
case _Ride():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ride value)?  $default,){
final _that = this;
switch (_that) {
case _Ride() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String passengerId,  String? driverId,  LocationPoint pickup,  LocationPoint dropoff,  double? fare,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ride() when $default != null:
return $default(_that.id,_that.passengerId,_that.driverId,_that.pickup,_that.dropoff,_that.fare,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String passengerId,  String? driverId,  LocationPoint pickup,  LocationPoint dropoff,  double? fare,  String status)  $default,) {final _that = this;
switch (_that) {
case _Ride():
return $default(_that.id,_that.passengerId,_that.driverId,_that.pickup,_that.dropoff,_that.fare,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String passengerId,  String? driverId,  LocationPoint pickup,  LocationPoint dropoff,  double? fare,  String status)?  $default,) {final _that = this;
switch (_that) {
case _Ride() when $default != null:
return $default(_that.id,_that.passengerId,_that.driverId,_that.pickup,_that.dropoff,_that.fare,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ride implements Ride {
  const _Ride({required this.id, required this.passengerId, this.driverId, required this.pickup, required this.dropoff, this.fare, this.status = 'searching'});
  factory _Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

@override final  String id;
@override final  String passengerId;
@override final  String? driverId;
@override final  LocationPoint pickup;
@override final  LocationPoint dropoff;
@override final  double? fare;
@override@JsonKey() final  String status;

/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RideCopyWith<_Ride> get copyWith => __$RideCopyWithImpl<_Ride>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ride&&(identical(other.id, id) || other.id == id)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.dropoff, dropoff) || other.dropoff == dropoff)&&(identical(other.fare, fare) || other.fare == fare)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,passengerId,driverId,pickup,dropoff,fare,status);

@override
String toString() {
  return 'Ride(id: $id, passengerId: $passengerId, driverId: $driverId, pickup: $pickup, dropoff: $dropoff, fare: $fare, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RideCopyWith<$Res> implements $RideCopyWith<$Res> {
  factory _$RideCopyWith(_Ride value, $Res Function(_Ride) _then) = __$RideCopyWithImpl;
@override @useResult
$Res call({
 String id, String passengerId, String? driverId, LocationPoint pickup, LocationPoint dropoff, double? fare, String status
});


@override $LocationPointCopyWith<$Res> get pickup;@override $LocationPointCopyWith<$Res> get dropoff;

}
/// @nodoc
class __$RideCopyWithImpl<$Res>
    implements _$RideCopyWith<$Res> {
  __$RideCopyWithImpl(this._self, this._then);

  final _Ride _self;
  final $Res Function(_Ride) _then;

/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? passengerId = null,Object? driverId = freezed,Object? pickup = null,Object? dropoff = null,Object? fare = freezed,Object? status = null,}) {
  return _then(_Ride(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,passengerId: null == passengerId ? _self.passengerId : passengerId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as LocationPoint,dropoff: null == dropoff ? _self.dropoff : dropoff // ignore: cast_nullable_to_non_nullable
as LocationPoint,fare: freezed == fare ? _self.fare : fare // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get pickup {
  
  return $LocationPointCopyWith<$Res>(_self.pickup, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}/// Create a copy of Ride
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get dropoff {
  
  return $LocationPointCopyWith<$Res>(_self.dropoff, (value) {
    return _then(_self.copyWith(dropoff: value));
  });
}
}


/// @nodoc
mixin _$LocationPoint {

 double get lat; double get lng; String? get address;
/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPointCopyWith<LocationPoint> get copyWith => _$LocationPointCopyWithImpl<LocationPoint>(this as LocationPoint, _$identity);

  /// Serializes this LocationPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'LocationPoint(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class $LocationPointCopyWith<$Res>  {
  factory $LocationPointCopyWith(LocationPoint value, $Res Function(LocationPoint) _then) = _$LocationPointCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, String? address
});




}
/// @nodoc
class _$LocationPointCopyWithImpl<$Res>
    implements $LocationPointCopyWith<$Res> {
  _$LocationPointCopyWithImpl(this._self, this._then);

  final LocationPoint _self;
  final $Res Function(LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationPoint].
extension LocationPointPatterns on LocationPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPoint value)  $default,){
final _that = this;
switch (_that) {
case _LocationPoint():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPoint value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  String? address)  $default,) {final _that = this;
switch (_that) {
case _LocationPoint():
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _LocationPoint() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPoint implements LocationPoint {
  const _LocationPoint({required this.lat, required this.lng, this.address});
  factory _LocationPoint.fromJson(Map<String, dynamic> json) => _$LocationPointFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  String? address;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPointCopyWith<_LocationPoint> get copyWith => __$LocationPointCopyWithImpl<_LocationPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'LocationPoint(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class _$LocationPointCopyWith<$Res> implements $LocationPointCopyWith<$Res> {
  factory _$LocationPointCopyWith(_LocationPoint value, $Res Function(_LocationPoint) _then) = __$LocationPointCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, String? address
});




}
/// @nodoc
class __$LocationPointCopyWithImpl<$Res>
    implements _$LocationPointCopyWith<$Res> {
  __$LocationPointCopyWithImpl(this._self, this._then);

  final _LocationPoint _self;
  final $Res Function(_LocationPoint) _then;

/// Create a copy of LocationPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? address = freezed,}) {
  return _then(_LocationPoint(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
