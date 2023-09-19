import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:notes_keeper/domain/models/user_model.dart';
import 'package:notes_keeper/domain/models/note_model.dart';

class DatabaseHelper {
  // database info
  static const _databaseName = "notes_keeper.db";
  static const _databaseVersion = 1;

  // user table
  static const tableUser = 'users';

  static const userColumnId = 'id';
  static const userColumnName = 'name';
  static const userColumnEmail = 'email';
  static const userColumnPassword = 'password';
  static const userColumnCreatedDate = 'createdDate';
  static const userColumnUpdatedDate = 'updatedDate';

  // note table
  static const tableNote = 'notes';

  static const noteColumnId = 'id';
  static const noteColumnUserId = 'userId';
  static const noteColumnTitle = 'title';
  static const noteColumnContent = 'content';
  static const noteColumnCreatedDate = 'createdDate';
  static const noteColumnUpdatedDate = 'updatedDate';

  // singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database tables.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser(
        $userColumnId TEXT PRIMARY KEY,
        $userColumnName TEXT,
        $userColumnEmail TEXT,
        $userColumnPassword TEXT,
        $userColumnCreatedDate DATETIME,
        $userColumnUpdatedDate DATETIME
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableNote(
        $noteColumnId TEXT PRIMARY KEY,
        $noteColumnUserId TEXT,
        $noteColumnTitle TEXT,
        $noteColumnContent TEXT,
        $noteColumnCreatedDate DATETIME,
        $noteColumnUpdatedDate DATETIME
      )
    ''');
  }

  // User methods
  Future<int> insertUser(User user) async {
    Database? db = await instance.database;
    return await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> getUserById(String id) async {
    final db = await database;
    final userMap = await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (userMap.isEmpty) {
      return null;
    }
    return User.fromMap(userMap.first);
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await database;
    final userMap =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (userMap.isEmpty) {
      return null;
    }
    return null;
  }

  Future<User?> getUserByEmailAndPassword(String email, String password) async {
    final db = await database;
    final userMap = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (userMap.isEmpty) {
      return null;
    }
    return User.fromMap(userMap.first);
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  // Note methods
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  Future<int> updateNoteById(Note note) async {
    final db = await database;
    return await db
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNoteById(String id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
