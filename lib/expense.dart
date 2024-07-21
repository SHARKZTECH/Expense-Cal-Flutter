import 'package:intl/intl.dart';

class Expense {
  final int id;
  final double amount;
  final DateTime date;
  final String category;

  static final columns = ['id', 'amount', 'date', 'category'];

  Expense(this.id, this.amount, this.date, this.category);

  factory Expense.fromMap(Map<String, dynamic> data) {
    return Expense(data['id'], data['amount'], DateTime.parse(data['date']),
        data['category']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "date": date.toIso8601String(),
        "category": category
      };

  String get formattedDate {
    var formatter = DateFormat("yyyy-MM-dd");
    return formatter.format(date);
  }
}
