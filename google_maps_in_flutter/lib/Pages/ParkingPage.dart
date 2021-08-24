import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ParkingPage extends StatefulWidget {
  var parkingMap = Map();
  ParkingPage(this.parkingMap);
  @override
  ParkingState createState() => ParkingState();
}

class ParkingState extends State<ParkingPage> {
  String myPark = 'A1';

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
                        _showConfirmDialog('A1', widget.parkingMap['A1']);
                      },
                child: new Container(
                  width: 100.0,
                  height: 57.0,
                  child: Center(
                    child: (widget.parkingMap['A1'])
                    ? new Image(image: AssetImage('imagens/car.png'),)
                    : new Text('A1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
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
                      _showConfirmDialog('A2', widget.parkingMap['A2']);
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center(
                        child: (widget.parkingMap['A2'])
                            ? new Image(image: AssetImage('imagens/car.png'),)
                            : new Text('A2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),)
                    ),
                  )
              ),
              ),
              Positioned(
                  left: 185,
                  top: 280,
                child: new GestureDetector(
                    onTap: (){
                      _showConfirmDialog('A3', widget.parkingMap['A3']);
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center(
                        child: (widget.parkingMap['A3'])
                            ? new Image(image: AssetImage('imagens/car.png'),)
                            : new Text('A3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),)
                    ),
                  )
              ),
              ),
              Positioned(
                  left: 293,
                  top: 280,
                child: new GestureDetector(
                    onTap: (){
                      _showConfirmDialog('A4', widget.parkingMap['A4']);
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center(
                        child: (widget.parkingMap['A4'])
                            ? new Image(image: AssetImage('imagens/car.png'),)
                            : new Text('A4',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),)
                    ),
                  )
              ),
              ),
              Positioned(
                  left: 185,
                  top: 345,
                child: new GestureDetector(
                    onTap: (){
                      _showConfirmDialog('A5', widget.parkingMap['A5']);
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center(
                        child: (widget.parkingMap['A5'])
                            ? new Image(image: AssetImage('imagens/car.png'),)
                            : new Text('A5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),)
                    ),

                  )
              ),
              ),
              Positioned(
                  left: 293,
                  top: 345,
                child: new GestureDetector(
                    onTap: (){
                      _showConfirmDialog('A6', widget.parkingMap['A6']);
                    },
                  child: new Container(
                    width: 100.0,
                    height: 57.0,
                    child: Center(
                        child: (widget.parkingMap['A6'])
                            ? new Image(image: AssetImage('imagens/car.png'),)
                            : new Text('A6',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),)
                    ),
                  )
              ),
              )
            ],
          )

        ),

      ),
    );
  }


  Future<void> _showConfirmDialog(String id, bool vaga) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child:
                (vaga)
                ?Text('Tem certeza que deseja tirar o carro da vaga?')
                :Text('Tem certeza que estacionou nesta vaga?'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                setState(() {
                  if(!vaga){
                    widget.parkingMap[myPark] = false;
                    myPark = id;
                    widget.parkingMap[id] = true;
                  }else{
                    widget.parkingMap[id] = false;
                  }

                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
