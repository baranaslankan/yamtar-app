import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/database.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _uploadedFileURL;
  File file = new File(
      'https://st2.depositphotos.com/1009634/7235/v/950/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg?forcejpeg=true');

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController2 = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    radius: 65.0,
                    child: RawMaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.all(65.0),
                      shape: CircleBorder(),
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _image = image;
                          file = File(_image!.path);
                        });
                      },
                    ),
                    backgroundImage: _image == null
                        ? NetworkImage(
                            'https://st2.depositphotos.com/1009634/7235/v/950/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg?forcejpeg=true')
                        : FileImage(file) as ImageProvider,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextField(
                      cursorColor: Colors.blueGrey[800],
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        hintText: 'Enter your e-mail address',
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blueGrey[800],
                        ),
                        labelText: 'E-Mail',
                        focusColor: Colors.blueGrey[800],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextField(
                      cursorColor: Colors.blueGrey[800],
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        hintText: 'Enter your name and surname',
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blueGrey[800],
                        ),
                        labelText: 'Name Surname',
                        focusColor: Colors.blueGrey[800],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextField(
                      cursorColor: Colors.blueGrey[800],
                      controller: _passwordController2,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        hintText: 'Enter your password',
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.blueGrey[800],
                        ),
                        labelText: 'Password',
                        focusColor: Colors.blueGrey[800],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextField(
                      cursorColor: Colors.blueGrey[800],
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]!),
                        ),
                        hintText: 'Enter your password again',
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.blueGrey[800],
                        ),
                        labelText: 'Password Confirmation',
                        focusColor: Colors.blueGrey[800],
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
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.indigo[900],
                        onPressed: () async {
                          User? user = (await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text)).user;
                          await user?.sendEmailVerification();
                          if (user != null) {
                            FirebaseAuth.instance.currentUser
                                ?.updateProfile(
                                    displayName: _nameController.text);
                            Reference storageReference = FirebaseStorage
                                .instance
                                .ref()
                                .child('profilePics/${user.uid}');
                            Future<TaskSnapshot> uploadTask =
                                storageReference.putFile(File(_image!.path)).whenComplete(()async => await storageReference
                                    .getDownloadURL()
                                    .then((fileURL) {
                                  setState(() {
                                    _uploadedFileURL = fileURL;
                                  });
                                }));
                            await DatabaseService(uid: user.uid).updateUserData(
                                _nameController.text,
                                _emailController.text,
                                _uploadedFileURL!);

                            await FirebaseAuth.instance.currentUser
                                ?.updateProfile(photoURL: _uploadedFileURL);
                            user.updateProfile();

                            Navigator.of(context).pushReplacementNamed('/log_in');
                          }
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account ?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 1,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Log In here.',
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/log_in')
                                    }),
                        ],
                      ),
                    ),
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
