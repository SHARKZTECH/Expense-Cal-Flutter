import 'package:expense_calculator/create_expense_page.dart';
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
          const ExpenseBox(
            amount: 100.0,
            date: "2019-04-01",
            category: "Food",
          ),
          ListView(
            shrinkWrap: true,
            children: const [
              ExpenseBox(
                amount: 100.0,
                date: "2019-04-01",
                category: "Food",
              ),
            ],
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
    required this.amount,
    required this.date,
    required this.category,
  });

  final double amount;
  final String date;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.monetization_on),
            Column(
              children: [Text("$category: $amount"), Text("spent on $date")],
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
