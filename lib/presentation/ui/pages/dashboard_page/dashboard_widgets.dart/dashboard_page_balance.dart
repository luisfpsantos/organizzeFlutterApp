import 'package:flutter/material.dart';

class DashboardBalance extends StatelessWidget {
  final Color balanceIndicatorCollor;
  final double amount;
  const DashboardBalance({
    Key? key,
    required this.balanceIndicatorCollor,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: balanceIndicatorCollor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo Geral',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(200, 85, 85, 85),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'R\$ $amount',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 221, 218, 218),
          thickness: 1,
          height: 25,
        ),
      ],
    );
  }
}
