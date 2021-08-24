import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';




class MapsPage extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<MapsPage> {
  late GoogleMapController mapController;
  late double lat;
  late double long;

  LatLng _center = const LatLng(-29.614003, -52.209617);
  void initState() {
    super.initState();
    addMarker();
  }

  Future<void> addMarker() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    Position position = await _determinePosition();
    LatLng latlng = new LatLng(position.latitude, position.longitude);
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(position.toString()),
      position: latlng,
      infoWindow: InfoWindow(
        title: 'Meu Carro',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    setState(() {
      _center = latlng;
      mapController.moveCamera(CameraUpdate.newLatLngZoom(latlng, 15));
    });
    print(position.longitude);
  }

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa Livre'),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 1,
          ),
        ),
      ),
    );

  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
