import 'package:shoghl/features/archive_feature/data/models/archive_feature_model.dart';
import 'package:shoghl/features/home_feature/data/model/account_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../features/home_feature/data/model/treatment_model.dart';
import '../../../features/laborers_feature/data/attendance_model.dart';
import '../../../features/laborers_feature/data/laborer_model.dart';

class LocalDatabase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  // Initialize database
  Future<Database> initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'account_database.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 4,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 4) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS Laborer(
          laborerId INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          addingDate TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE IF NOT EXISTS Attendance(
          attendanceId INTEGER PRIMARY KEY AUTOINCREMENT,
          laborerId INTEGER,
          date TEXT,
          status TEXT,
          FOREIGN KEY (laborerId) REFERENCES Laborer(laborerId)
        )
      ''');
      print('======================database upgraded======================');
    }
  }

  // Create tables
  void _onCreate(Database db, int version) async {
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

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Laborer(
        laborerId INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        addingDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Attendance(
        attendanceId INTEGER PRIMARY KEY AUTOINCREMENT,
        laborerId INTEGER,
        date TEXT,
        status TEXT,
        FOREIGN KEY (laborerId) REFERENCES Laborer(laborerId)
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS ArchiveItem(
        ArchiveItemId INTEGER PRIMARY KEY AUTOINCREMENT,
        value TEXT,
        title TEXT
      )
    ''');

    print('======================database created======================');
  }

  // Insert data into Account table
  Future<int> insertAccountData({required Account account}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
      "INSERT INTO Account(ownerName, locationName, lastEdit, totalIncome, totalExpenses) VALUES (?, ?, ?, ?, ?)",
      [account.ownerName, account.locationName, account.lastEdit, account.totalIncome, account.totalExpenses],
    );
    return response;
  }

  // Get data from Account table
  Future<List<Map<String, dynamic>>> getAccountData() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery("SELECT * FROM Account");
    return response;
  }

  // Insert data into Treatment table
  Future<int> insertTreatmentData({required Treatment treatment, required int accId}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
      "INSERT INTO Treatment(accountId, title, time, cost, details, isIncome) VALUES (?, ?, ?, ?, ?, ?)",
      [accId, treatment.title, treatment.time, treatment.cost, treatment.details, treatment.isIncome ? 1 : 0],
    );
    return response;
  }

  // Get data from Treatment table
  Future<List<Map<String, dynamic>>> getTreatmentData({required int accId}) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery("SELECT * FROM Treatment WHERE accountId = ?", [accId]);
    return response;
  }

  // Get income treatments
  Future<List<Map<String, dynamic>>> getIncomeTreatments() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery('''
      SELECT t.*, a.ownerName as accountName 
      FROM Treatment t 
      INNER JOIN Account a ON t.accountId = a.accountId 
      WHERE t.isIncome = 1
    ''');
    return response;
  }

  // Get expense treatments
  Future<List<Map<String, dynamic>>> getExpensesTreatments() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery('''
      SELECT t.*, a.ownerName as accountName 
      FROM Treatment t 
      INNER JOIN Account a ON t.accountId = a.accountId 
      WHERE t.isIncome = 0
    ''');
    return response;
  }

  // Delete account with treatments
  Future<void> deleteAccountWithTreatments(int accountId) async {
    Database? mydb = await db;
    await mydb!.delete('Treatment', where: 'accountId = ?', whereArgs: [accountId]);
    await mydb.delete('Account', where: 'accountId = ?', whereArgs: [accountId]);
  }

  // Delete treatment
  Future<void> deleteTreatment(int treatmentId) async {
    Database? mydb = await db;
    await mydb!.delete('Treatment', where: 'treatmentId = ?', whereArgs: [treatmentId]);
  }

  // Insert data into Laborer table
  Future<int> addLaborer({required Laborer laborer}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
      "INSERT INTO Laborer(name, addingDate) VALUES (?, ?)",
      [laborer.name, laborer.addingDate],
    );
    return response;
  }

  // Get all laborers
  Future<List<Map<String, dynamic>>> getLaborers() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery("SELECT * FROM Laborer");
    return response;
  }

  // Edit data in Laborer table
  Future<int> editLaborer({required int laborerId, required Laborer laborer}) async {
    Database? mydb = await db;
    int response = await mydb!.update(
      'Laborer',
      {'name': laborer.name, 'addingDate': laborer.addingDate},
      where: 'laborerId = ?',
      whereArgs: [laborerId],
    );
    return response;
  }

  // Delete laborer with attendance
  Future<void> deleteLaborerWithAttendance(int laborerId) async {
    Database? mydb = await db;
    await mydb!.delete('Attendance', where: 'laborerId = ?', whereArgs: [laborerId]);
    await mydb.delete('Laborer', where: 'laborerId = ?', whereArgs: [laborerId]);
  }

  // Insert data into Attendance table
  Future<int> addAttendance({required int laborerId, required Attendance attendance}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
      "INSERT INTO Attendance(laborerId, date, status) VALUES (?, ?, ?)",
      [laborerId, attendance.date, attendance.status],
    );
    return response;
  }

  // Get attendance data for a specific laborer
  Future<List<Map<String, dynamic>>> getAttendanceData({required int laborerId}) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery("SELECT * FROM Attendance WHERE laborerId = ?", [laborerId]);
    return response;
  }

  // Insert data into ArchiveItem table
  Future<int> insertArchiveDate({required ArchiveItem archiveItem}) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
      "INSERT INTO ArchiveItem(value, title) VALUES (?, ?)",
      [archiveItem.value, archiveItem.title],
    );
    return response;
  }

  // Get data from ArchiveItem table
  Future<List<Map<String, dynamic>>> getArchiveData() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery("SELECT * FROM ArchiveItem");
    return response;
  }

  // Delete archive item
  Future<void> deleteArchiveItem({required int archiveId}) async {
    Database? mydb = await db;
    await mydb!.delete('ArchiveItem', where: 'ArchiveItemId = ?', whereArgs: [archiveId]);
  }
}
