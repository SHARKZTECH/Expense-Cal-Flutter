import 'package:intl/intl.dart';

class Expense {
  final int? id;
  final double amount;
  final DateTime date;
  final String category;

  static final columns = ['id', 'amount', 'date', 'category'];

  Expense(this.amount, this.date, this.category, {this.id});

  factory Expense.fromMap(Map<String, dynamic> data) {
    return Expense(
        data['amount'], DateTime.parse(data['date']), data['category'],
        id: data['id']);
  }

  Map<String, dynamic> toMap() =>
      {"amount": amount, "date": date.toIso8601String(), "category": category};

  String get formattedDate {
    var formatter = DateFormat("yyyy-MM-dd");
    return formatter.format(date);
  }
}
