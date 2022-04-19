import 'package:organizze_app/presentation/ui/pages/login_page/login_page_dependencies/login_page_dependencies.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers() {
    List<SingleChildWidget> allProviders = [];

    LoginPageDependencies.providers().forEach((element) {
      allProviders.add(element);
    });

    return allProviders;
  }
}
