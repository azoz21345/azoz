
import 'package:finalporject/json1/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{

  // database
  SqlDb._privateConstructor(); // Name constructor to create instance of database
  static final SqlDb instance = SqlDb._privateConstructor();

  final databaseName = "userdb3.db";

  // Table
  String user = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      password TEXT,
      mobile TEXT
    )
    ''';
  Future<Database> intialDb() async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version)async{
      await db.execute(user);
    });
  }

  Future<Users> loginUser(String u, String p) async{
    final Database db = await intialDb();
    final result = await db.rawQuery(
        "select * from users where username = '${u}' AND password = '${p}'");
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      throw Exception("usernam or password not found");
    }
  }

  Future<int> createUser(Users usr) async{
    final Database db = await intialDb();
    return db.rawInsert("INSERT INTO 'users' ('username', 'password', 'Mobile') VALUES ('${usr.username}', '${usr.password}', '')");
  }

  Future<int> deleteUser(Users usr) async{
    final Database db = await intialDb();
    return await db.rawDelete('DELETE FROM users where id =?',['${usr.id}']);
  }

  Future<void> updateUser(Users usr) async{
    final Database db = await intialDb();
    await db.update(
      'users',
      usr.toMap(),
      where: "id = ?",
      whereArgs: [usr.id],
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<Users>> getAllUsers() async {
    final Database db = await intialDb();
    List<Map> list = await db.rawQuery('SELECT * FROM users');
    return list.map((usr) => Users.fromMap(usr as Map<String, dynamic>)).toList();
  }
}
