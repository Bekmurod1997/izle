import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:izle/controller/creating_add_info_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(41.26465, 69.21627),
  //   zoom: 11.5,
  // );
  late GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String location = 'null, press button';
  String address = 'search';
  double? lat;
  double? long;
  bool manualP = false;
  Marker? manualPosition;
  Position? position;
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(double? lat, double? long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long!);
    print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print('-------------------' + address);
    creatingAddInfoController.locationInfoChanger(
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}');
    print('locationInfo controller');
    print(creatingAddInfoController.locationInfo);
  }

  @override
  void initState() {
    _determinePosition();
    latAndLong();
    super.initState();
  }

  void latAndLong() async {
    position = await _determinePosition();
    creatingAddInfoController.landAndLongChanger(
        position!.latitude, position!.longitude);
    print(position!.latitude);
    print(position!.longitude);
    setState(() {
      lat = position!.latitude;
      long = position!.longitude;
    });
    getAddressFromLatLong(lat, long);
  }

  List<Marker> myMarkers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(
                  '[{"elementType": "geometry","stylers": [{"color": "#212121"}]},{"elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"elementType": "labels.text.fill","stylers": [{"color": "#757575"}]},{"elementType": "labels.text.stroke","stylers": [{"color": "#212121"}]},{"featureType": "administrative","elementType": "geometry","stylers": [{"color": "#757575"}]},{"featureType": "administrative.country","elementType": "labels.text.fill","stylers": [{"color": "#9e9e9e"}]},{"featureType": "administrative.locality","elementType": "labels.text.fill","stylers": [{"color": "#bdbdbd"}]},{"featureType": "poi","elementType": "labels.text.fill","stylers": [{"color": "#757575"}]},{"featureType": "poi.park","elementType": "geometry","stylers": [{"color": "#181818"}]},{"featureType": "poi.park","elementType": "labels.text.fill","stylers": [{"color": "#616161"}]},{"featureType": "poi.park","elementType": "labels.text.stroke","stylers": [{"color": "#1b1b1b"}]},{"featureType": "road","elementType": "geometry.fill","stylers": [{"color": "#2c2c2c"}]},{"featureType": "road","elementType": "labels.text.fill","stylers": [{"color": "#8a8a8a"}]},{"featureType": "road.arterial","elementType": "geometry","stylers": [{"color": "#373737"}]},{"featureType": "road.highway","elementType": "geometry","stylers": [{"color": "#3c3c3c"}]},{"featureType": "road.highway.controlled_access","elementType": "geometry","stylers": [{"color": "#4e4e4e"}]},{"featureType": "road.local","elementType": "labels.text.fill","stylers": [{"color": "#616161"}]},{"featureType": "transit","elementType": "labels.text.fill","stylers": [{"color": "#757575"}]},{ "featureType": "water","elementType": "geometry","stylers": [{"color": "#000000"}]},{"featureType": "water","elementType": "labels.text.fill","stylers": [{"color": "#3d3d3d"}]}]');
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                lat!,
                long!,
              ),
              zoom: 11.5,
            ),
            markers: manualP == true
                ? Set.from(myMarkers)
                : {
                    Marker(
                      onTap: () => print('tapeed one1'),
                      infoWindow: InfoWindow(
                        title: 'InfoWindowText 1',
                      ),
                      markerId: MarkerId('current'),
                      position: LatLng(lat!, long!),
                    ),
                  },
            onTap: handleTap,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: 200,
            child: Text(
              '$lat and $long',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarkers = [];
      myMarkers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        ),
      );
      manualP = true;
      lat = tappedPoint.latitude;
      long = tappedPoint.longitude;

      // position!.latitude = tappedPoint.latitude;
      getAddressFromLatLong(tappedPoint.latitude, tappedPoint.longitude);
    });
    creatingAddInfoController.landAndLongChanger(
        tappedPoint.latitude, tappedPoint.longitude);
    print(
        '${creatingAddInfoController.lat.value} and  ${creatingAddInfoController.long.value}');
  }
}
