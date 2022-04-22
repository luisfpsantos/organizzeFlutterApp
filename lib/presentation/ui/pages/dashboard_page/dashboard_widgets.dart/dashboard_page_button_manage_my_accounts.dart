import 'package:flutter/material.dart';

class DashboardButtonManageMyaccounts extends StatelessWidget {
  final void Function() onPressed;
  const DashboardButtonManageMyaccounts({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Gerenciar Contas',
        style: TextStyle(color: Color.fromARGB(255, 9, 60, 102), fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 0),
        primary: const Color.fromARGB(255, 201, 231, 255),
        elevation: 0,
      ),
      onPressed: onPressed,
    );
  }
}
