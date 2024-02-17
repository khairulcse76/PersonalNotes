import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._privateConstructor();
  static Database? _database;

  NotesDatabase._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Notes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pin BOOLEAN NOT NULL,
        title TEXT,
        content TEXT,
        createdTime TEXT
      );
    ''');
  }

  Future<bool?> insertData() async {
    final db = await instance.database;
    await db?.insert("notes", {
      "pin": 1, // Assuming pin is an integer (0 for false, 1 for true)
      "title": "My Notes Title 234",
      "content": "This is Content 234",
      "createdTime": "15-Feb-2024"
    });
    return true;
  }

  Future<String> ReadAllData() async{
    final db = await instance.database;
    //final orderBy =  'createdTime DESC';
    final orderBy =  'id DESC';
    final query_result= await db?.query('Notes', orderBy: orderBy);
    print(query_result);
    return 'Success';
  }
  Future<String> ReadOneData(int id) async{
    final db = await instance.database;
    final map= await db?.query('Notes',
        columns: ['title'],
      where: 'id=?',
      whereArgs: [id]
    );
    print(map);
    return 'Success';
  }

  Future UpdateData(int id) async{
    final db = await instance.database;
    final mapupdate= await db?.update('Notes',
        {"title":"this is update Title", "content":"this is update content"},
    where: "id=?",
      whereArgs: [id],
    );
    print(mapupdate);
    return 'Success';
  }
  
  Future DeleteEntry(int id) async{
    final db = await instance.database;
    await db?.delete("Notes",
    where: 'id=?',
      whereArgs: [id],
    );
  }
  
}
