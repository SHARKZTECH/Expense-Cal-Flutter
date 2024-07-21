import 'package:expense_calculator/expense.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  final Expense item;
  const ExpensePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Details"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              initialValue: item.amount.toString(),
              decoration: const InputDecoration(
                label: Text("Amount"),
                icon: Icon(Icons.monetization_on),
              ),
            ),
            TextFormField(
              initialValue: item.formattedDate,
              decoration: const InputDecoration(
                label: Text("Date"),
                icon: Icon(Icons.calendar_month),
              ),
            ),
            TextFormField(
              initialValue: item.category,
              decoration: const InputDecoration(
                label: Text("Category"),
                icon: Icon(Icons.category),
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Update"),
            )
          ],
        )),
      ),
    );
  }
}
