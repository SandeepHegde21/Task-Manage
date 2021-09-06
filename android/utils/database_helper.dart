import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Note {
  int _id;
  var _title;
  var _desc;
  var _date;
  int _priority;
  Note(this._title, this._date, this._priority, [this._desc]);
  Note.withId(this._id, this._date, this._priority, [this._desc]);

  int get id => _id;
  int get priority => _priority;
  String get title => _title;
  String get desc => _desc;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length > 255) {
      this.title = newTitle;
    }
  }

  set desc(String newDesc) {
    if (newDesc.length > 255) {
      this._desc = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['desc'] = desc;
    map['date'] = date;
    map['priority'] = priority;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._date = map['date'];
    this._priority = map['priority'];
  }
}

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = "Description";
  String colDate = "Date";
  String colPriority = 'Priority';

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createdb);
    return notesDatabase;
  }

  void _createdb(Database db, int newVersion) async {
    await db.execute(
        'Create Datase $_noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDesc TEXT,$colPriority INTEGER,$colDate)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db
        .rawQuery('SELECT * FROM  $_noteTable ORDER BY $colPriority ASC');
    return result;
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(_noteTable, note.toMap());

    return result;
  }

  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(_noteTable, note.toMap(),
        where: '$colId=?', whereArgs: [note.id]);

    return result;
  }

  Future<int> deleteNote(int id) async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $_noteTable $colId=$id');

    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.query('SELECT COUNT(*) FROM $_noteTable');
    int result = Sqflite.firstIntValue(x);

    return result;
  }
}
