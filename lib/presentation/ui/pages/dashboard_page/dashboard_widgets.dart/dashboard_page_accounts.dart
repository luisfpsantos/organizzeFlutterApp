import 'package:flutter/material.dart';

class DashboardAccount extends StatelessWidget {
  final void Function() onPressed;
  final String accountName;
  final IconData accountIcon;
  final double amount;
  const DashboardAccount({
    Key? key,
    required this.onPressed,
    required this.accountName,
    required this.accountIcon,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(accountIcon),
              const SizedBox(
                width: 10,
              ),
              Text(accountName),
            ],
          ),
          Text('R\$ $amount')
        ],
      ),
    );
  }
}
