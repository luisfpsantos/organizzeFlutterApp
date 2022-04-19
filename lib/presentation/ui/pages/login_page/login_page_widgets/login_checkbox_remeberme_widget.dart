import 'package:flutter/material.dart';

class LoginCheckboxRemembermeWidget extends StatefulWidget {
  final bool value;
  final void Function(bool?) onChanged;
  const LoginCheckboxRemembermeWidget(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<LoginCheckboxRemembermeWidget> createState() =>
      _LoginCheckboxRemembermeWidgetState();
}

class _LoginCheckboxRemembermeWidgetState
    extends State<LoginCheckboxRemembermeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(value: widget.value, onChanged: widget.onChanged),
        const Text('Lembrar Login'),
      ],
    );
  }
}
