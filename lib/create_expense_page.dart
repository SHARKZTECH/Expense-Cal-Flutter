import 'package:expense_calculator/database.dart';
import 'package:expense_calculator/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateExpensePage extends StatefulWidget {
  const CreateExpensePage({super.key});

  @override
  State<CreateExpensePage> createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  Future<void> _saveExpense() async {
    if (_formKey.currentState?.validate() ?? false) {
      final amount = double.parse(_amountController.text);
      final date = DateTime.parse(_dateController.text);
      final category = _categoryController.text;

      final newExpense = Expense(0, amount, date, category);

      await SQLiteDbProvider.db.createExpense(newExpense);

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    icon: Icon(Icons.monetization_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    label: Text("Date"),
                    icon: Icon(Icons.calendar_month),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    if (DateTime.tryParse(value) == null) {
                      return 'Please enter a valid date (yyyy-MM-dd)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                    icon: Icon(Icons.category),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                ),
                FilledButton(
                  onPressed: _saveExpense,
                  child: const Text("Submit"),
                )
              ],
            )),
      ),
    );
  }
}
