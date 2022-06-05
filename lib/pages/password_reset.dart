import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Password_Reset extends StatefulWidget {
  const Password_Reset({ Key? key }) : super(key: key);

  @override
  State<Password_Reset> createState() => _Password_ResetState();
}

class _Password_ResetState extends State<Password_Reset> {

  TextEditingController _emailController=new TextEditingController();
  @override
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://www.fonewalls.com/wp-content/uploads/2020/04/Yellow-Phone-Wallpaper.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 100.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                radius: 65.0,
                backgroundImage: NetworkImage('https://www.iconsdb.com/icons/preview/navy-blue/private-xxl.png'),
              ),
                  Padding(
                padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                child: Container(
                  child: Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:20.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                  height: 40.0,
                  width: 400,
                  decoration: new BoxDecoration(
                    color: Colors.indigo[900],
                    borderRadius: new BorderRadius.circular(
                      40.0
                    ),
                  ),
                  
                ),
              ),
                  Container(
                    height: 50,
                    decoration: new BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text('   Please enter your e-mail address to reset\n your password !',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
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
                        labelStyle: TextStyle(
                            color: Colors.grey[800]
                        ),
                        prefixIcon: Icon(Icons.email,color: Colors.blueGrey[800],),
                        labelText: 'E-Mail',focusColor: Colors.blueGrey[800],),
                    ),
                  ),
                  MaterialButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.indigo[900],
                      onPressed: ()async{
                        resetPassword(_emailController.text);
                        Navigator.of(context).pushReplacementNamed('/log_in');
                      }
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