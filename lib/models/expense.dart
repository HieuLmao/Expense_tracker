import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formater = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  Expense({
    required this.amount,
    required this.title,
    required this.dateTime,
    required this.category,
  }) : id = const Uuid().v4();

  String get formatedDate {
    return formater.format(dateTime);
  }
}
