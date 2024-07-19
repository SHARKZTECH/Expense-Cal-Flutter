import 'package:flutter/material.dart';

class CreateExpensePage extends StatelessWidget {
  const CreateExpensePage({super.key});

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
              decoration: const InputDecoration(
                label: Text("Amount"),
                icon: Icon(Icons.monetization_on),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Date"),
                icon: Icon(Icons.calendar_month),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Category"),
                icon: Icon(Icons.category),
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Submit"),
            )
          ],
        )),
      ),
    );
  }
}
