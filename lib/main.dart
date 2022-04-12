
import 'package:flutter/material.dart';
import 'package:shape/SignUpScreen.dart';
import 'package:shape/homeScreen.dart';
import 'package:shape/utils/dbhelper.dart';
import 'package:shape/models/user.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MaterialApp(home:SignInScreen() ,));
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final DbHelper = DatabaseHelper.instance;
  bool value = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  showAlertDialog(BuildContext context,String message,String header) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context).pop(); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black87,
      title: Text(header,style: TextStyle(color: Colors.white70),),
      content: Text(message,style: TextStyle(color: Colors.white60),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  void _check(String email,String password)async{
    final isit = await DbHelper.getLoginUser(email, password);
    if(isit){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const homeScreen()));
    }
    else{
      String message="Email or password can be wrong.If you are not sign-up yet please sign-up.";
      String header="Carefull!";
      showAlertDialog(context,message,header);

    }

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(
          brightness: Brightness.dark,
          primary: Colors.black,
          secondary: Colors.white,
          background: const Color(0xFF212121),
        ),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 55,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 40,
                    offset: Offset(0, 3),
                  )
                ]),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white12,
                      filled: true,
                      hintText: "e-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 40,
                    offset: Offset(0, 3),
                  )
                ]),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white12,
                      filled: true,
                      hintText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    child: Checkbox(
                        activeColor: Colors.white12,
                        value: value,
                        onChanged: (value) =>
                            setState((() => this.value = value!))),
                  ),
                  Container(
                    child: Text(
                      "Remember me",
                      style: TextStyle(color: Colors.white38),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign in with social account",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    color: Colors.white38,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(125, 10, 125, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0.0),
                      width: 45,
                      child: IconButton(
                          icon: Image.asset('assets/images/facebook_icon.png'),
                          onPressed: () {}),
                    ),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      width: 43,
                      child: IconButton(
                          icon: Image.asset('assets/images/twitter_icon.png'),
                          onPressed: () {}),
                    ),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      width: 50,
                      child: IconButton(
                          icon: Image.asset(
                            'assets/images/google_icon.png',
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String email=emailController.text;
                  String password=passwordController.text;
                  _check(email, password);


                },
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white70),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white12,
                  padding: EdgeInsets.symmetric(horizontal: 132, vertical: 22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(5, 11, 0, 0),
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.white38,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 11, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.grey),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
