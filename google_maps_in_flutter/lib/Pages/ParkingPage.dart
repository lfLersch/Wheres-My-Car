import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ParkingPage extends StatefulWidget {
  var parkingMap = Map();
  ParkingPage(this.parkingMap);
  @override
  ParkingState createState() => ParkingState();
}

class ParkingState extends State<ParkingPage> {

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('imagens/parkinglayout.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 185,
                top: 215,
                  child: new GestureDetector(
                      onTap: (){
                        setState(() {
                          widget.parkingMap['A1'] = !widget.parkingMap['A1'];
                        });
                      },
                child: new Container(
                  width: 100.0,
                  height: 57.0,
                  child: Center(
                    child: (widget.parkingMap['A1'])
                    ? new Text('A1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                    ),)
                    :new Text('A1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),)
                  ),
                )
              ),
              ),

              Positioned(
                  left: 293,
                  top: 215,
                child: new GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.parkingMap['A2'] = !widget.parkingMap['A2'];
                        print(widget.parkingMap['A2']);
                      });
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center( child:
                    new Text('A2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),),),
                  )
              ),
              ),
              Positioned(
                  left: 185,
                  top: 280,
                child: new GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center( child:
                    new Text('A3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),),),
                  )
              ),
              ),
              Positioned(
                  left: 293,
                  top: 280,
                child: new GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center( child:
                    new Text('A4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),),),
                  )
              ),
              ),
              Positioned(
                  left: 185,
                  top: 345,
                child: new GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center( child:
                    new Text('A5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),),),

                  )
              ),
              ),
              Positioned(
                  left: 293,
                  top: 345,
                child: new GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center( child:
                      new Text('A6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                      ),),),
                  )
              ),
              )
            ],
          )

        ),

      ),
    );
  }
}
