import 'dart:async';
import 'dart:io';
import 'package:expense_calculator/expense.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();

  late Database _database;
  bool _isDatabaseInitialized = false;

  Future<Database> get database async {
    if (_isDatabaseInitialized) {
      return _database;
    }

    _database = await initDB();
    _isDatabaseInitialized = true;
    return _database;
  }

  Future<void> deleteDatabaseFile() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpenseDB.db");
    if (await databaseExists(path)) {
      await deleteDatabase(path);
    }
  }

  Future<Database> initDB() async {
    await deleteDatabaseFile(); // Clear the existing database first
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpenseDB.db");

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE Expense (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            date TEXT,
            category TEXT
          );
        """);
        await insertExpenses(db);
      },
    );
  }

  Future<void> insertExpenses(Database db) async {
    await db.insert('Expense', {
      'amount': 100.0,
      'date': DateTime.now().toIso8601String(),
      'category': "Food One"
    });
    await db.insert('Expense', {
      'amount': 10.0,
      'date': DateTime.now().toIso8601String(),
      'category': "Food Two"
    });
  }

  Future<Expense> createExpense(Expense expense) async {
    final db = await database;
    int id = await db.insert('Expense', expense.toMap());
    return Expense(expense.amount, expense.date, expense.category, id: id);
  }

  Future<Expense?> getExpenseById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Expense',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Expense.fromMap(result.first) : null;
  }

  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query('Expense');
    return results.map((result) => Expense.fromMap(result)).toList();
  }

  Future<int> updateExpense(Expense expense) async {
    final db = await database;
    return await db.update(
      'Expense',
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  Future<int> deleteExpense(int? id) async {
    final db = await database;
    return await db.delete(
      'Expense',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<double> getTotalExpense() async {
    final db = await database;
    List<Map> list =
        await db.rawQuery("Select SUM(amount) as amount from expense");
    return list.isNotEmpty ? list[0]["amount"] : Null;
  }
}
