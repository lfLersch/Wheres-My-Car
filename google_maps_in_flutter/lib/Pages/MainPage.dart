import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_in_flutter/Pages/LoginPage.dart';
import 'package:google_maps_in_flutter/Pages/MapsPage.dart';
import 'package:google_maps_in_flutter/Pages/ParkingPage.dart';

class MainPage extends StatefulWidget {
  final User user;

  const MainPage({required this.user});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
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
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                onSurface: Colors.green,
                    elevation: 20,
                    shadowColor: Colors.red,
                ),
                child: Text('Sign Out'),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
     );
  }

}