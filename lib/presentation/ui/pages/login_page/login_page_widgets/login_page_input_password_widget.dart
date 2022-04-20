import 'package:flutter/material.dart';

class LoginInputPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool readingOnly;
  final String? errorText;

  const LoginInputPasswordWidget({
    Key? key,
    required this.readingOnly,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  State<LoginInputPasswordWidget> createState() =>
      _LoginInputPasswordWidgetState();
}

class _LoginInputPasswordWidgetState extends State<LoginInputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: true,
      keyboardType: TextInputType.text,
      readOnly: widget.readingOnly,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        label: const Text('Senha'),
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
