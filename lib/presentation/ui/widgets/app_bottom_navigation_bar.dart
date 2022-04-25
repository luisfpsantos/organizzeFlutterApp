import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTaped;
  const AppBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTaped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: onTaped,
      items: items,
    );
  }

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.compare_arrows),
      label: 'Transactions',
    ),
  ];
}
