import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Log_In extends StatefulWidget {
  const Log_In({Key? key}) : super(key: key);

  @override
  State<Log_In> createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Text(
                      "Yamtar App",
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Log In",
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
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(10, 16, 230, 16),
                  //   child: Text("GİRİŞ YAP",
                  //     style: TextStyle(
                  //       color: Colors.grey[800],
                  //       fontSize: 35.0,
                  //       fontWeight: FontWeight.bold,
                  //     ),),
                  // ),
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
                        labelText: 'E-Mail', focusColor: Colors.blueGrey[800],
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.blue,
                        //   ),
                        // ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(30.0),
                        // ),
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
                        hintText: "Enter your password",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey[800],
                        ),
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.blueGrey[800],
                        ),
                        labelText: 'Password', focusColor: Colors.blueGrey[800],
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.blue,
                        //   ),
                        // ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(30.0),
                        // ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(240, 8, 0, 5),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Forgot Password',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    letterSpacing: 1.0,
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              '/password_reset');
                                    }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 40, 100, 0),
                        child: MaterialButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            padding: EdgeInsets.fromLTRB(45.0, 9.0, 45.0, 9.0),
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            color: Colors.indigo[900],
                            onPressed: () async {
                              User? user = (await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text))
                                  .user;
                              if (!user!.emailVerified) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("E-mail"),
                                        content: Text(
                                            "Please activate your e-mail"),
                                      );
                                    });
                              }
                              else{
                              Navigator.of(context).pushReplacementNamed('/bluetooth');}
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 0.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account ?',
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign Up here.',
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/sign_up')
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
