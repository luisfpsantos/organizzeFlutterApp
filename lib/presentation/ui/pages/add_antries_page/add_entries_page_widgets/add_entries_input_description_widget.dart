import 'package:flutter/material.dart';

class AddEntriesInputDescription extends StatelessWidget {
  final TextEditingController controller;
  const AddEntriesInputDescription({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Adicione a descrição',
        border: InputBorder.none,
        icon: Padding(
          padding: EdgeInsets.only(right: 6),
          child: Icon(
            Icons.create,
            size: 26,
          ),
        ),
      ),
    );
  }
}
