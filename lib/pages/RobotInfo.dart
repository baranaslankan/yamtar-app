import 'package:flutter/material.dart';

class RobotInfo extends StatelessWidget {
  const RobotInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(
        'https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
    fit: BoxFit.cover,
    ),),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://i.pinimg.com/originals/e0/7c/e1/e07ce1d112281265324005fa9ba1b804.png'),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
              child: Container(
                child: Center(
                  child: Text(
                    "YAMTAR Robotic Arm Controller",
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
            Container(
              height: 150,
              width: 300,
              child: Card(
                shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                ),
                child: Center(child: Text("You can control the\nautonomous robot arm\nwith yamtar robotic arm\ncontroller application.")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Container(
                color: Colors.indigo[900],
                child: TextButton(
                  child: Text("Control Device",style: TextStyle(color: Colors.white),),
                  onPressed: ()async{
                    Navigator.of(context).pushReplacementNamed('/controller');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
