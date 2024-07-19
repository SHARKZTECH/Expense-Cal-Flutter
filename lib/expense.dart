import 'package:intl/intl.dart';

class Expense {
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
    var formatter = new DateFormat("yyyy-MM-dd");
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
}
