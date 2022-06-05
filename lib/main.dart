import 'package:flutter/material.dart';
import 'package:yamtar_app/pages/animation_screen.dart';
import 'package:yamtar_app/pages/log_in.dart';
import 'package:yamtar_app/pages/password_reset.dart';
import 'package:yamtar_app/pages/robot_controller.dart';
import 'package:yamtar_app/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yamtar_app/pages/bluetooth_devices.dart';

void main()async{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Animation_Screen(),
      '/log_in':(context) => Log_In(),
      '/sign_up':(context) => Sign_Up(),
      '/password_reset':(context) => Password_Reset(),
      '/controller':(context)=>Robot_Controller(),
      '/bluetooth':(context)=>BluetoothService(),
      
      
    },
  ));
  await Firebase.initializeApp();
}