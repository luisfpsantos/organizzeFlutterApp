import 'package:flutter/material.dart';

class LoginInputUserWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool readingOnly;
  final String? errorText;

  const LoginInputUserWidget({
    Key? key,
    required this.readingOnly,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  State<LoginInputUserWidget> createState() => _LoginInputUserWidgetState();
}

class _LoginInputUserWidgetState extends State<LoginInputUserWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      readOnly: widget.readingOnly,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        label: const Text('Usuário'),
        floatingLabelStyle: const TextStyle(fontSize: 22),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        errorText: widget.errorText,
        errorStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
