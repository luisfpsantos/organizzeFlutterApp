import 'package:flutter/material.dart';

class DashboardCreditCard extends StatelessWidget {
  final String bankName;
  final double amountAvailable;
  final double currentInvoice;
  final IconData bankIcon;
  final Color amountAvailableColor;
  const DashboardCreditCard({
    Key? key,
    required this.bankName,
    required this.amountAvailable,
    required this.currentInvoice,
    required this.bankIcon,
    required this.amountAvailableColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      onPressed: () {},
      child: Column(
        children: [
          Row(
            children: [
              Icon(bankIcon),
              const SizedBox(
                width: 10,
              ),
              Text(
                bankName,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Disponível',
                      style: TextStyle(
                        color: Color.fromARGB(200, 85, 85, 85),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'R\$ $amountAvailable',
                      style: TextStyle(color: amountAvailableColor),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Fatura Atual',
                    style: TextStyle(
                      color: Color.fromARGB(200, 85, 85, 85),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'R\$ $currentInvoice',
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
