import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

class NotificationPage extends StatefulWidget {
  final UserEntity loggedUser;
  const NotificationPage({Key? key, required this.loggedUser})
      : super(key: key);
  static const routeName = '/notification';
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
    );
  }
}
