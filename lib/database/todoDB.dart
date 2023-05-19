import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todoModel.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._();
  static Database? _database;
  TodoDatabase._();

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY NOT NULL';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''CREATE TABLE $todoTable (
      ${TodoFields.id} $idType,
      ${TodoFields.title} $textType,
      ${TodoFields.created} $textType,
      ${TodoFields.status} $boolType
    )''');
  }

  Future _initDB(String filename) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filename);
    return openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB('todo.db');
      return database;
    }
  }

  // This is the block of code that will handle the toggling of the check box
  Future<int> toggleTodoDone(Todo todo) async {
    final db = await instance.database;
    todo.status = !todo.status;
    return db!.update(todoTable, todo.toJson(),
        where: '${TodoFields.id} = ?', whereArgs: [todo.id]);
  }

  // This block of code is going to insert todo data into the table
  Future createTodo(Todo todo) async {
    final db = await instance.database;
    await db!.insert(todoTable, todo.toJson());
    return todo;
  }

  // This function get all todos
  Future<List<Todo>> getTodo(/*int id*//*Todo todo*/ /*String title*/) async {
    final db = await instance.database;
    final result = await db!.query(
      todoTable,
      orderBy: '${TodoFields.created} DESC',
      // where: '${TodoFields.id} = ?',
      // whereArgs: [id]
    );
    print(result);
    return result.map((e) => Todo.fromJson(e)).toList();
  }

  // This function updatese the todos
  Future updateTodo(Todo todo) async {
    final db = await instance.database;
    await db!.update(todoTable, todo.toJson(),
        where: '${TodoFields.title} = ?', whereArgs: [todo.title]);
  }

  // This function deletes a todo
  Future<int> delTodo(Todo todo) async {
    final db = await instance.database;
    return db!.delete(todoTable,
        where: '${TodoFields.id} = ?', whereArgs: [todo.id]);
  }
}
