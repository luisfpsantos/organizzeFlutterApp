import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_category_entity.dart';

abstract class AddEntriesPageStates {}

class PageIdle extends AddEntriesPageStates {}

class Loading extends AddEntriesPageStates {}

class Error extends AddEntriesPageStates {
  final String msg;

  Error(this.msg);
}

class Success extends AddEntriesPageStates {}

class CategoriesSuccess extends AddEntriesPageStates {
  final List<UserCategoryEntity> list;

  CategoriesSuccess(this.list);
}

class ExpenseActive extends AddEntriesPageStates {
  final Color expenseActive = Colors.white;
  final Color incomeDefault = const Color.fromARGB(255, 177, 177, 177);
  final Color backgroundColor = const Color.fromARGB(255, 245, 101, 91);
  final IconData thumb;

  ExpenseActive(this.thumb);
}

class IncomeActive extends AddEntriesPageStates {
  final Color expenseDefault = const Color.fromARGB(255, 177, 177, 177);
  final Color incomeActive = Colors.white;
  final Color backgroundColor = const Color.fromARGB(255, 109, 177, 111);
  final IconData thumb;

  IncomeActive(this.thumb);
}
