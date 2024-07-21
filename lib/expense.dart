import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

class Expense extends Model {
  final int id;
  final double amount;
  final DateTime date;
  final String category;

  Expense(
      {required this.id,
      required this.amount,
      required this.date,
      required this.category});

  String get formattedDate {
    var formatter = DateFormat("yyyy-MM-dd");
    return formatter.format(date);
  }

  static final columns = ['id', 'amount', 'date', 'category'];

  factory Expense.fromMap(Map<String, dynamic> data) {
    return Expense(
        id: data['id'],
        amount: data['amount'],
        date: data['date'],
        category: data['category']);
  }

  Map<String, dynamic> toMap() =>
      {"id": id, "amount": amount, "date": date, "category": category};

  static List<Expense> getExpenses() {
    List<Expense> items = [];

    items.add(
        Expense(id: 1, amount: 10.0, date: DateTime.now(), category: "Food 1"));
    items.add(
        Expense(id: 2, amount: 10.0, date: DateTime.now(), category: "Food 2"));
    items.add(
        Expense(id: 3, amount: 10.0, date: DateTime.now(), category: "Food 3"));
    items.add(
        Expense(id: 4, amount: 10.0, date: DateTime.now(), category: "Food 4"));

    return items;
  }
}
