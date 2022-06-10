import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothService extends StatefulWidget {
  const BluetoothService({Key? key}) : super(key: key);

  @override
  _BluetoothServiceState createState() => _BluetoothServiceState();
}

class _BluetoothServiceState extends State<BluetoothService> {
  List<ScanResult> devicesList=<ScanResult>[];
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  String deviceName="device";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Service"),
        centerTitle: true,
        backgroundColor:Colors.indigo[900] ,
      ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:250),
                  child: Container(
                    color: Colors.indigo[900],
                    child: TextButton(
                      child: Text("search for device",style: TextStyle(color: Colors.white),),
                      onPressed: ()async{
                        // Start scanning
                        flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
                        var subscription = flutterBlue.scanResults.listen((results) {
                          // do something with scan results
                          for (ScanResult r in results) {
                            devicesList.add(r);
                            print('${r.device.name} found! rssi: ${r.rssi}');
                          }
                        });

// Stop scanning
                        flutterBlue.stopScan();
                        print(devicesList);
                        setState(() {
                          deviceName=devicesList[0].device.name;
                        });




                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Container(
                    color: Colors.indigo[900],
                    child: TextButton(
                      child: Text("connect ${deviceName}",style: TextStyle(color: Colors.white),),
                      onPressed:() {
                        print("Connected to ${deviceName=devicesList[0].device.name}");
                        Navigator.of(context).pushReplacementNamed('/info');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
