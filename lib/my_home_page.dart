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
      body: const Column(
        children: <Widget>[
          Text(
            "Total expense: 1000.0",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.start,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.monetization_on),
                  Column(
                    children: [
                      Text("Food: 1000.0"),
                      Text("spent on 2019-04-01")
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.monetization_on),
                  Column(
                    children: [
                      Text("Food: 1000.0"),
                      Text("spent on 2019-04-01")
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
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
