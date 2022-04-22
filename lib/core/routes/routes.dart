import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/ui/pages/account_entries_page/account_entries_page.dart';
import '../../presentation/ui/pages/home_page/home_page.dart';
import '../../presentation/ui/pages/login_page/login_page.dart';
import '../../presentation/ui/pages/notification_page/notification_page.dart';
import '../../presentation/ui/pages/user_settings_page/user_settings_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routName:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case HomePage.routName:
        final homePageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => HomePage(loggedUser: homePageArgs),
        );

      case UserSettingsPage.routeName:
        final userSettingsPageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => UserSettingsPage(
            loggedUser: userSettingsPageArgs,
          ),
        );

      case NotificationPage.routeName:
        final notificationPageArgs = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (context) => NotificationPage(
            loggedUser: notificationPageArgs,
          ),
        );

      case AccountEntriesPage.routName:
        final accountEntriesPageArgs =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => AccountEntriesPage(
            loggedUser: accountEntriesPageArgs['loggedUser'],
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
