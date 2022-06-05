import 'package:flutter/material.dart';

class Robot_Controller extends StatefulWidget {
  const Robot_Controller({Key? key}) : super(key: key);

  @override
  _Robot_ControllerState createState() => _Robot_ControllerState();
}

class _Robot_ControllerState extends State<Robot_Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Vehicle Control",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                    ),
                    height: 40.0,
                    width: 400,
                    decoration: new BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: MaterialButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        child: Text(
                          '↑',
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                        ),
                        color: Colors.indigo[900],
                        onPressed: () async {

                        }
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: MaterialButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        child: Text(
                          '←',
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                        ),
                        color: Colors.indigo[900],
                        onPressed: () async {

                        }
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: MaterialButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        child: Text(
                          '→',
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                        ),
                        color: Colors.indigo[900],
                        onPressed: () async {

                        }
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: MaterialButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        child: Text(
                          '↓',
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                        ),
                        color: Colors.indigo[900],
                        onPressed: () async {

                        }
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Robotic Arm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ),
                      height: 40.0,
                      width: 400,
                      decoration: new BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 76.0, vertical: 16.0),
                        child: MaterialButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            child: Text(
                              'Keep',
                              style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                            ),
                            color: Colors.indigo[900],
                            onPressed: () async {

                            }
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        child: MaterialButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            child: Text(
                              'Leave',
                              style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                            ),
                            color: Colors.indigo[900],
                            onPressed: () async {

                            }
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
