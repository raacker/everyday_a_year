import "dart:io";
import "dart:async";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart";

import "package:everyday_a_year/data/everyday_log.dart";

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _tableName = "logs";

  // Define _createInstance method
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
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
    String path = directory.path + "everyday_log.db";

    var logDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return logDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $_tableName ( "
      "  ${EverydayLog.ID_COL} INTEGER PRIMARY KEY AUTOINCREMENT, "
      "  ${EverydayLog.TITLE_COL} TEXT, "
      "  ${EverydayLog.DATE_COL} TIMESTAMP, "
      "  ${EverydayLog.DESCRIPTION_COL} TEXT, "
      "  ${EverydayLog.IMAGE_LINK_COL} TEXT, "
      "  ${EverydayLog.LOG_TYPE_COL} INTEGER "
      ")"
    );
  }

  Future<List<EverydayLog>> getLogs() async {
    Database db = await this.database;

    var result = await db.query(_tableName,
      orderBy: "${EverydayLog.DATE_COL} DESC",
    );

    List<EverydayLog> logs = [];
    for (var r in result) {
      EverydayLog log = EverydayLog.fromMap(r);
      logs.add(log);
    }
    return logs;
  } 

  Future<int> insertLog(EverydayLog log) async {
    Database db = await this.database;

    var result = await db.insert(_tableName, log.toMap());
    return result;
  }

  Future<int> updateLog(EverydayLog log) async {
    Database db = await this.database;

    var result = await db.update(
      _tableName, log.toMap(),
      where: "${EverydayLog.ID_COL} = ?",
      whereArgs: [log.id],
    );
    return result;
  }

  Future<int> deleteLog(int id) async {
    Database db = await this.database;
    var result = await db.delete(_tableName,
      where: "${EverydayLog.ID_COL} = ?",
      whereArgs: [id],
    );
    return result;
  }
}