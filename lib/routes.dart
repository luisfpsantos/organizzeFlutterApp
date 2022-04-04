import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/ui/pages/home_page/home_page.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page.dart';
import 'package:organizze_app/presentation/ui/pages/notification_page/notification_page.dart';
import 'package:organizze_app/presentation/ui/pages/user_settings_page/user_settings_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/home':
        final homePageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => HomePage(loggedUser: homePageArgs),
        );
      case '/userSettings':
        final userSettingsPageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => UserSettingsPage(
            loggedUser: userSettingsPageArgs,
          ),
        );
      case '/notification':
        final notificationPageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => NotificationPage(
            loggedUser: notificationPageArgs,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('PageError'),
            ),
          ),
        );
    }
  }
}
