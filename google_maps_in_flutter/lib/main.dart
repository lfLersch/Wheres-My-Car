import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/Pages/MapsPage.dart';
import 'package:google_maps_in_flutter/Pages/ParkingPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Wheres my car',
    home: MyApp(),));}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-29.614003, -52.209617);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.red,
                  onSurface: Colors.green,
                  elevation: 20,
                  shadowColor: Colors.red,
                ),
                child: Text('Salvar localização'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MapsPage()));
                },
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onSurface: Colors.green,
                  elevation: 20,
                  shadowColor: Colors.red,
                ),
                child: Text('Estacionamento'),
                onPressed: () {
                  Map<String, bool> parkingMap = {'A1': false, 'A2': false, 'A3': false, 'A4': false, 'A5': false, 'A6': false,};
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ParkingPage(parkingMap)));
                },
              ),
            ],
          ),
        ),



        /*body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),*/
      ),
    );
  }
}
