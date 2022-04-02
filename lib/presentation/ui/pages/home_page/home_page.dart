import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

class HomePage extends StatefulWidget {
  final UserEntity loggedUser;
  const HomePage({Key? key, required this.loggedUser}) : super(key: key);

  static const routName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loggedUser.name),
      ),
    );
  }
}
