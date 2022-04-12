// @dart=2.9
import 'package:shape/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{

  static final _databaseName = "userdb.db";
  static final _databaseVersion = 1;
  static final table = 'users_table';
  static final columnId = 'id';
  static final columName = 'name';
  static final columnLastName = 'lastName';
  static final columnEmail = 'email';
  static final columnPassword ='password';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async{
    if(_database!=null) {
      return _database;
    }
    _database=await _initDatabase();
    return _database;
  }
  _initDatabase() async{
    String path = join(await getDatabasesPath(),_databaseName);
    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db,int version)async{
    await db.execute('''
      CREATE TABLE $table(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columName TEXT NOT NULL,
      $columnLastName TEXT NOT NULL,
      $columnEmail TEXT NOT NULL,
      $columnPassword TEXT NOT NULL
      )
      '''
    );
  }
  Future<int> insert(User user) async{
    Database db = await instance.database;
    return await db.insert(table, {'name' : user.name,'lastName' : user.lastName,'email' : user.email,'password': user.password});
  }
  Future<int> update(User user)async{
    Database db = await instance.database;
    int id=user.toMap()['id'];
    return await db.update(table, user.toMap(),where: '$columnId = ?',whereArgs: [id]);
  }
  Future<int> delete(int id)async{
    Database db = await instance.database;
    return await db.delete(table , where:'$columnId = ?',whereArgs: [id]);
  }
  Future<List<Map<String,dynamic>>> queryRows(name)async{
    Database db = await instance.database;
    return await db.query(table,where: "$columName LIKE '%$name½'");
  }
  Future<List<Map<String,dynamic>>> queryAllRows()async{
    Database db = await instance.database;
    return await db.query(table);

  }
  Future<int> queryRowCount()async{
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  Future<bool> getLoginUser(String email,String password)async{
    Database db = await instance.database;
    var res = await db.rawQuery("SELECT * FROM $table WHERE "
        "$columnEmail = '$email' AND "
        "$columnPassword = '$password'");
    if(res.isNotEmpty){
      return true;
    }
    return false;


  }

}