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
        pin INTEGER,
        title TEXT,
        content TEXT,
        createdTime TEXT
      );
    ''');
  }

  Future<bool> insertData() async {
    final db = await database;
    final id = await db?.insert("notes", {
      "pin": 0, // Assuming pin is an integer (0 for false, 1 for true)
      "title": "My Notes Title",
      "content": "This is Content",
      "createdTime": "15-Feb-2024"
    });
    return id != null;
  }
}
