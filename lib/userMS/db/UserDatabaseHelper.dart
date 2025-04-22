import 'package:app_02/userMS/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDataBaseHelper {
  static final UserDataBaseHelper instance = UserDataBaseHelper._init();
  static Database? _database;

  UserDataBaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      phone TEXT NOT NULL,
      email TEXT NOT NULL,
      avatar TEXT,
      dateOfBirth TEXT NOT NULL
    )
    ''');
    await _insertSampleData(db);
  }

  Future _insertSampleData(Database db) async {
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'Nguyen Van A',
        'email': 'nguyenvana@gmail.com',
        'phone': '0905032003',
        'avatar': null,
        'dateOfBirth': DateTime(1990, 5, 15).toIso8601String(),
      },
      {
        'name': 'Nguyen Van B',
        'email': 'nguyenvanb@gmail.com',
        'phone': '0905032003',
        'avatar': null,
        'dateOfBirth': DateTime(1995, 5, 15).toIso8601String(),
      },
      {
        'name': 'Nguyen Van C',
        'email': 'nguyenvanc@gmail.com',
        'phone': '0905032003',
        'avatar': null,
        'dateOfBirth': DateTime(2000, 5, 15).toIso8601String(),
      },
    ];
    for (final userData in sampleUsers) {
      await db.insert('users', userData);
    }
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }

  Future<int> createUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query("users");
    return result.map((map) => User.fromMap(map)).toList();
  }

  Future<User?> getUserById(int id) async {
    final db = await instance.database;
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);

    if(maps.isNotEmpty){
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async{
    final db = await instance.database;
    return await db.update('users', user.toMap(),where: 'id=?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async{
    final db = await instance.database;
    return await db.delete('users',where: 'id=?',whereArgs: [id]);
  }

  Future<int> deleteAllUsers() async{
    final db = await instance.database;
    return await db.delete('users');
  }

  Future<int> countUsers() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result)?? 0;
  }
}
