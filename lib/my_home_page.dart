import 'package:expense_calculator/create_expense_page.dart';
import 'package:expense_calculator/expense.dart';
import 'package:expense_calculator/expense_page.dart';
import 'package:expense_calculator/expenselistmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
          builder: (context) => ScopedModelDescendant<ExpenseListModel>(
              builder: (context, child, expenses) {
            return CreateExpensePage(
              expenses: expenses,
            );
          }),
        ));
  }

  final items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ScopedModelDescendant<ExpenseListModel>(
        builder: (context, child, expenses) {
          return ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    title: Text(
                      "Total Expense:${expenses.totalExpense}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  index = index - 1;
                  return Dismissible(
                      key: Key(expenses.items[index].id.toString()),
                      onDismissed: (direction) {
                        expenses.delete(expenses.items[index]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Item with id, ${expenses.items[index].id} is dismissed"),
                          ),
                        );
                      },
                      child: ExpenseBox(
                        item: expenses.items[index],
                      ));
                }
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount:
                  expenses.items == null ? 1 : expenses.items.length + 1);
        },
      ),
      floatingActionButton: ScopedModelDescendant<ExpenseListModel>(
          builder: (context, child, expense) {
        return FloatingActionButton(
          onPressed: createExpensePage,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
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
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExpensePage(
                      item: item,
                    )));
      },
    );
  }
}
