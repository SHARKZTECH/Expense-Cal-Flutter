import 'package:expense_calculator/create_expense_page.dart';
import 'package:expense_calculator/expense.dart';
import 'package:expense_calculator/expense_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void createExpensePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateExpensePage(),
        ));
  }

  final items = Expense.getExpenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const Text(
            "Total expense: 1000.0",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ExpenseBox(item: items[index]);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createExpensePage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ExpenseBox extends StatelessWidget {
  const ExpenseBox({
    super.key,
    required this.item,
  });

  final Expense item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.monetization_on),
              Column(
                children: [
                  Text("${item.category}: ${item.amount.toString()}"),
                  Text("spent on ${item.formattedDate}")
                ],
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ExpensePage()));
      },
    );
  }
}
