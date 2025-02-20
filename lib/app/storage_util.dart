import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/model/models.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'likes_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Likes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        store TEXT
      )
    ''');
  }
Future<void> insertLike(Store store) async {
    final db = await database;
    await db.insert('Likes', {'store': json.encode(store.toJson())});
  }

  Future<void> deleteLike(Store store) async {
    final db = await database;
    await db.delete('Likes', where: 'store = ?', whereArgs: [json.encode(store.toJson())]);
  }

  Future<List<Store>> getLikes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Likes');
    return List.generate(maps.length, (i) {
      return Store.fromJson(json.decode(maps[i]['store']));
    });
  }
}