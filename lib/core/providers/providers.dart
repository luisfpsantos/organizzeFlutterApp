import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_dependencies/add_account_page_dependencies.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_dependencies/add_entries_page_dependencies.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_dependencies/login_page_dependencies.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers() {
    return [
      ...LoginPageDependencies.providers(),
      ...AddEntriesPageDependencies.providers(),
      ...AddAccountPageDependencies.providers()
    ];
  }
}
