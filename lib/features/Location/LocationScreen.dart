
// import 'package:cure_team_2/features/Location/Location_Manager.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Locationscreen extends StatefulWidget {
//   const Locationscreen({super.key});

//   @override
//   State<Locationscreen> createState() => _LocationscreenState();
// }

// class _LocationscreenState extends State<Locationscreen> {
//   ///1.mylocation 2.latlng 3.marker 4.googleMapController
//   final LocationManager mylocation = LocationManager();

//   final initialCameraPosition = const CameraPosition(
//     target: LatLng(0, 0),
//     zoom: 14,
//   );
//   Set<Marker> markers = const <Marker>{};
//   GoogleMapController? googleMapController;
//   Set<Polyline> polylines = const <Polyline>{};

//   @override
//   void initState() {
//     _getUserLocation();
//     super.initState();
//   }

//   Future<void> _getUserLocation() async {
//     final Locationdata = await mylocation.getUserLocation();
//     if (Locationdata == null) return;
//     final currenlocation = LatLng(
//       Locationdata.latitude!,
//       Locationdata.longitude!,
//     );
//     final userMarker = Marker(
//       markerId: const MarkerId('user_location'),
//       position: currenlocation,
//     );
//     googleMapController?.animateCamera(CameraUpdate.newLatLng(currenlocation));
//     setState(() {
//       markers.clear();
//       markers.add(userMarker);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             _getUserLocation();
//           },
//           icon:const Text('getLocation'),
//         ),
//       ),
//       body: GoogleMap(
//         myLocationEnabled: true,
//         myLocationButtonEnabled: true,
//         polylines: polylines,
//         onMapCreated: (controller) {
//           googleMapController = controller;
//         },
//         markers: markers,
//         initialCameraPosition: initialCameraPosition,
//         mapType: MapType.normal,
//       ),
//     );
//   }
// }
