import 'package:mynotes/model/MyNoteModel.dart';
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

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const textType = "TEXT NOT NULL";
    await db.execute('''
      CREATE TABLE ${NotesImpNames.tableName} (
        ${NotesImpNames.id} $idType,
        ${NotesImpNames.pin} $boolType,
        ${NotesImpNames.isArchive} $boolType,
        ${NotesImpNames.title} $textType,
        ${NotesImpNames.content} $textType,
        ${NotesImpNames.createdTime} $textType
      );
    ''');
  }

  Future<Note?> insertData(Note note) async {
    final db = await instance.database;
     final id = await db?.insert(NotesImpNames.tableName, note.toJson(),
   /* db?.insert("notes", { // Manual Entry Code
      "pin": 1, // Assuming pin is an integer (0 for false, 1 for true)
      "title": "My Notes Title 234",
      "content": "This is Content 234",
      "createdTime": "15-Feb-2024"
    }*/
    );
    return note.copy(id: id);
    // return true;
  }

  Future<List<Note>> ReadAllData() async{
    final db = await instance.database;
    //final orderBy =  'createdTime DESC';
    final orderBy =  '${NotesImpNames.createdTime} DESC';
    final queryResult= await db!.query(NotesImpNames.tableName, orderBy: orderBy);
    
    return queryResult.map((json) => Note.fromJson(json)).toList();
  }
  Future<Note?> ReadOneData(int id) async{
    final db = await instance.database;
    final map= await db?.query(NotesImpNames.tableName,
        columns: NotesImpNames.values,
      where: '${NotesImpNames.id}=?',
      whereArgs: [id]
    );
    if(map!.isNotEmpty){
      return Note.fromJson(map.first);
    }else{
      return null;
    }
  }

  Future UpdateData(Note note) async{
    final db = await instance.database;
    final mapUpdate= await db?.update(NotesImpNames.tableName,note.toJson(),
    where: "${NotesImpNames.id}=?",
      whereArgs: [note.id],
    );
  }
  /*Future PinUpdate(Note note) async {
    final db = await instance.database;
    final newPinValue = note.copy(pin: !note.pin).pin;
    print('New Pin Value: $newPinValue');

    await db!.update(
      NotesImpNames.tableName,
      {NotesImpNames.pin: newPinValue ? 1 : 0},
      where: "${NotesImpNames.id}=?",
      whereArgs: [note.id],
    );
  }
*/
  Future PinUpdate(Note note) async {
    final db = await instance.database;
    await db!.update(
      NotesImpNames.tableName,
      {NotesImpNames.pin: note.copy(pin: !note.pin).pin ? 1 : 0},
      where: "${NotesImpNames.id}=?",
      whereArgs: [note.id],
    );
  }

  Future ArchiveUpdate(Note note) async {
    final db = await instance.database;
    await db!.update(
      NotesImpNames.tableName,
      {NotesImpNames.isArchive: note.copy(isArchive: !note.isArchive).isArchive ? 1 : 0},
      where: "${NotesImpNames.id}=?",
      whereArgs: [note.id],
    );
  }


  Future DeleteEntry(Note note) async{
    final db = await instance.database;
    await db?.delete(NotesImpNames.tableName,
    where: '${NotesImpNames.id  }=?',
      whereArgs: [note.id],
    );
  }
  /*Future DeleteEntry(int id) async{
    final db = await instance.database;
    await db?.delete("Notes",
    where: 'id=?',
      whereArgs:[id]
    );
  }
*/
  Future closeDB() async{
    final db = await instance.database;
    db!.close();
  }

  Future<List<int>> getNoteString(String query) async{
    final db=await instance.database;
    final result = await db!.query(NotesImpNames.tableName);
    List<int>resultIds=[];
    result.forEach((element) {
      if(element['title'].toString().toLowerCase().contains(query) || element['content'].toString().toLowerCase().contains(query)){
        resultIds.add(element['id'] as int);
      }
    });
    return resultIds;
  }

}
