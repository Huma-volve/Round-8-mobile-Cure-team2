// import 'package:location/location.dart';

// class LocationManager {
//   ///1.mylocation
//   Location myLocation = Location();

//   ///2.requestPermission
//   Future<bool> _requestPermission() async {
//    final Reqpermission= await myLocation.requestPermission();
//    return Reqpermission == PermissionStatus.granted;
//   }

//   ///3.requestService
//   Future<bool>_requestService()async{
// final Reqservice=await myLocation.requestService();
// return Reqservice;
//   }
//   ///4.getUserLocation
//   Future<LocationData?>getUserLocation()async{
//     final permission=await _requestPermission();
//     final enableService =await _requestService();
//     if(!permission||!enableService){
//       return myLocation.getLocation();
//     }
//   }

// }
