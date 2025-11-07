// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../services/location_service.dart';
// import '../../models/ride.dart';

// class MapPicker extends ConsumerStatefulWidget {
//   final LocationPoint? initialPickup;
//   final LocationPoint? initialDropoff;
//   final ValueChanged<LocationPoint?>? onPickupChanged;
//   final ValueChanged<LocationPoint?>? onDropoffChanged;
//   const MapPicker({
//     super.key,
//     this.initialPickup,
//     this.initialDropoff,
//     this.onPickupChanged,
//     this.onDropoffChanged,
//   });

//   @override
//   ConsumerState<MapPicker> createState() => _MapPickerState();
// }

// class _MapPickerState extends ConsumerState<MapPicker> {
//   LocationPoint? _pickup;
//   LocationPoint? _dropoff;
//   bool _selectingPickup = true; // first tap sets pickup, second sets dropoff

//   @override
//   void initState() {
//     super.initState();
//     _pickup = widget.initialPickup;
//     _dropoff = widget.initialDropoff;
//     _selectingPickup = _pickup == null; // if pickup missing, select it first
//   }

//   void _onMapTap(LatLng latLng) {
//     final point = LocationPoint(lat: latLng.latitude, lng: latLng.longitude);
//     setState(() {
//       if (_selectingPickup) {
//         _pickup = point;
//         widget.onPickupChanged?.call(point);
//         _selectingPickup = false; // next choose dropoff
//       } else {
//         _dropoff = point;
//         widget.onDropoffChanged?.call(point);
//         _selectingPickup = true; // alternate if user continues
//       }
//     });
//   }

//   Set<Marker> _markers() {
//     final markers = <Marker>{};
//     if (_pickup != null) {
//       markers.add(
//         Marker(
//           markerId: const MarkerId('pickup'),
//           position: LatLng(_pickup!.lat, _pickup!.lng),
//           infoWindow: const InfoWindow(title: 'Pickup'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueGreen,
//           ),
//           draggable: true,
//           onDragEnd: (p) {
//             final point = LocationPoint(lat: p.latitude, lng: p.longitude);
//             setState(() => _pickup = point);
//             widget.onPickupChanged?.call(point);
//           },
//         ),
//       );
//     }
//     if (_dropoff != null) {
//       markers.add(
//         Marker(
//           markerId: const MarkerId('dropoff'),
//           position: LatLng(_dropoff!.lat, _dropoff!.lng),
//           infoWindow: const InfoWindow(title: 'Dropoff'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueAzure,
//           ),
//           draggable: true,
//           onDragEnd: (p) {
//             final point = LocationPoint(lat: p.latitude, lng: p.longitude);
//             setState(() => _dropoff = point);
//             widget.onDropoffChanged?.call(point);
//           },
//         ),
//       );
//     }
//     return markers;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loc = ref.watch(currentLocationProvider).value;
//     final initial = CameraPosition(
//       target: LatLng(
//         _pickup?.lat ?? loc?.lat ?? 8.9806,
//         _pickup?.lng ?? loc?.lng ?? 38.7578,
//       ),
//       zoom: 13,
//     );

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: Stack(
//         children: [
//           GoogleMap(
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             compassEnabled: true,
//             initialCameraPosition: initial,
//             onMapCreated: (_) {},
//             onTap: _onMapTap,
//             markers: _markers(),
//           ),
//           Positioned(
//             top: 12,
//             left: 12,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 _selectingPickup
//                     ? 'Tap to select Pickup'
//                     : 'Tap to select Dropoff',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
