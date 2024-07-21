import 'package:expense_calculator/database.dart';
import 'package:expense_calculator/expense.dart';
import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the Flutter bindings are initialized
  runApp(MyApp(
    expenses: SQLiteDbProvider.db.getAllExpenses(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<List<Expense>> expenses;
  const MyApp({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Expense calculator',
        expenses: expenses,
      ),
    );
  }
}
