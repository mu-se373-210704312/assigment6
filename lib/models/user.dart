// @dart=2.9
import 'package:shape/utils/dbhelper.dart';

class User{
  int id;
  String name;
  String lastName;
  String email;
  String password;

  User({this.id,this.name,this.lastName,this.email,this.password});

  User.fromMap(Map<String,dynamic> map){
    id=map['id'];
    name=map['name'];
    lastName=map['lastName'];
    email=map['email'];
    password=map['password'];
  }
  Map<String,dynamic> toMap(){

    return{
      DatabaseHelper.columnId:id,
      DatabaseHelper.columName:name,
      DatabaseHelper.columnLastName:lastName,
      DatabaseHelper.columnEmail:email,
      DatabaseHelper.columnPassword:password,

    };


  }
}