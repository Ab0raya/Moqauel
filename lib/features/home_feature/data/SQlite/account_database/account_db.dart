import 'package:shoghl/features/home_feature/data/model/account_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../model/treatment_model.dart';

class AccountDatabase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize database
  initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'account_database.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('======================database upgraded======================');
  }

  //create table
  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS Account(
      accountId INTEGER PRIMARY KEY AUTOINCREMENT,
      ownerName TEXT,
      locationName TEXT,
      lastEdit TEXT,
      totalIncome INTEGER,
      totalExpenses INTEGER
    )
  ''');

    /*
    treatmentId INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      time TEXT,
      cost INTEGER,
      details TEXT,
      isIncome INTEGER
     */
    await db.execute('''
    CREATE TABLE IF NOT EXISTS Treatment(
       treatmentId INTEGER PRIMARY KEY AUTOINCREMENT,
      accountId INTEGER,
      title TEXT,
      time TEXT,
      cost INTEGER,
      details TEXT,
      isIncome INTEGER,
      FOREIGN KEY (accountId) REFERENCES Account(accountId)
    )
  ''');

    print('======================database created======================');
  }



  insertAccountData({required Account account}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
        "INSERT INTO Account(ownerName, locationName, lastEdit, totalIncome, totalExpenses) VALUES ('${account.ownerName}', '${account.locationName}', '${account.lastEdit}', ${account.totalIncome}, ${account.totalExpenses})");
    return response;
  }

  getAccountData() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery("SELECT * FROM 'Account'");
    return response;
  }

  // Insert data into Treatment table
  insertTreatmentData({required Treatment treatment,required int accId}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
        "INSERT INTO Treatment(accountId, title, time, cost, details, isIncome) VALUES ('$accId','${treatment.title}', '${treatment.time}', ${treatment.cost}, '${treatment.details}', ${treatment.isIncome ? 1 : 0})");
    return response;
  }

  // Get data from Treatment table
  getTreatmentData({required int accId}) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery("SELECT * FROM 'Treatment' WHERE accountId = $accId");
    return response;
  }



  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
