import 'package:flutter/material.dart';

abstract class AddEntriesPageStates {}

class PageIdle extends AddEntriesPageStates {}

class Loading extends AddEntriesPageStates {}

class Error extends AddEntriesPageStates {
  final String msg;

  Error(this.msg);
}

class Success extends AddEntriesPageStates {}

class ExpenseActive extends AddEntriesPageStates {
  final Color expenseActive = Colors.white;
  final Color incomeDefault = const Color.fromARGB(255, 177, 177, 177);
  final Color backgroundColor = Colors.red;
  final IconData thumb;

  ExpenseActive(this.thumb);
}

class IncomeActive extends AddEntriesPageStates {
  final Color expenseDefault = const Color.fromARGB(255, 177, 177, 177);
  final Color incomeActive = Colors.white;
  final Color backgroundColor = Colors.green;
  final IconData thumb;

  IncomeActive(this.thumb);
}
