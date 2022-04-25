import 'package:flutter/material.dart';

class AddAccountModalBottomIcons extends StatelessWidget {
  final Widget widget;
  const AddAccountModalBottomIcons({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 50,
        minHeight: 200,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: widget,
          ),
        ],
      ),
    );
  }
}
