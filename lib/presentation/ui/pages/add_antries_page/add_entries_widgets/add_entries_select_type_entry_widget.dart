import 'package:flutter/material.dart';

class AddEntryTypeSelect extends StatelessWidget {
  final void Function() expensePressed;
  final void Function() incomePressed;
  final Color textExpenseColor;
  final Color textIncomeColor;
  final Color backgroundColor;
  final String prefixSimbol;
  final void Function() thumbPressed;
  final IconData thumbIcon;
  final TextEditingController controller;

  const AddEntryTypeSelect({
    Key? key,
    required this.expensePressed,
    required this.incomePressed,
    required this.textExpenseColor,
    required this.textIncomeColor,
    required this.backgroundColor,
    required this.prefixSimbol,
    required this.thumbPressed,
    required this.thumbIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 220,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: expensePressed,
                child: Text(
                  'Despesa',
                  style: TextStyle(
                    color: textExpenseColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: incomePressed,
                child: Text(
                  'Receita',
                  style: TextStyle(
                    color: textIncomeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: controller,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '0,00',
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding: const EdgeInsets.only(top: 5),
                border: InputBorder.none,
                prefixIcon: Text(
                  prefixSimbol,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: thumbPressed,
                  icon: Icon(
                    thumbIcon,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
