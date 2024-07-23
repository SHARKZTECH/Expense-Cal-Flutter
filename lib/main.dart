import 'package:expense_calculator/database.dart';
import 'package:expense_calculator/expense.dart';
import 'package:expense_calculator/expenselistmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'my_home_page.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the Flutter bindings are initialized

  final expenses = ExpenseListModel();
  runApp(ScopedModel<ExpenseListModel>(model: expenses, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Expense calculator',
      ),
    );
  }
}
