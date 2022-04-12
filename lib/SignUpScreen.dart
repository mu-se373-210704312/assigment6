import 'package:flutter/material.dart';
import 'package:shape/utils/dbhelper.dart';
import 'package:shape/models/user.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(SignUpScreen());
}


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final DbHelper = DatabaseHelper.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _insert(String name, String lastName,String email,String password) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columName: name,
      DatabaseHelper.columnLastName: lastName,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnPassword: password
    };
    User user= User.fromMap(row);
    final id =await DbHelper.insert(user);
    final snackBar = SnackBar(
      content: const Text('User successfully added'),);
  }

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
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 55,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                  controller: nameController,
                  decoration: InputDecoration(
                      fillColor: Colors.white12,
                      filled: true,
                      hintText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              SizedBox(
                height: 20,
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
                  controller: lastNameController,
                  decoration: InputDecoration(
                      fillColor: Colors.white12,
                      filled: true,
                      hintText: "last name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
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
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign up with social account",
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
                  String name = nameController.text;
                  String lastName = lastNameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  _insert(name, lastName, email, password);
                  String message="You create the account succesfully";
                  String header="Thank you!";
                  showAlertDialog(context,message,header);
                  nameController.clear();
                  lastNameController.clear();
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text(
                  "Sign up",
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
                      "Do you have an account?",
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign in",
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
