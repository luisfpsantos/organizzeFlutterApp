import 'package:flutter/material.dart';
import 'package:organizze_app/data/datasources/firebase/verify_login_with_databse_datasource_imp.dart';
import 'package:organizze_app/data/repositories/verify_login_with_database_repository_imp.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _accessWithBiometry = false;
  final LoginPageController _loginPageController = LoginPageController(
    VerifyLoginWithDatabaseUsecaseImp(
      VerifyLoginWithDatabaseRepositoryImp(
        VerifyLoginWithDatabaseDatasourceImp(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTitle(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: buildInputUser(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                    child: buildInputPass(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                    child: buildEntryOptions(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: buildSubmitButton(),
                  ),
                  const Text(
                    'Ou\nEntrar Com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  buildGoogleButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/dollar-symbol.png',
            scale: 6,
          ),
        ),
        const Text(
          'Organizze',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildInputUser() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        label: const Text('Usuário'),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget buildInputPass() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        label: const Text('Senha'),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget buildEntryOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: _rememberMe,
            onChanged: (value) {
              setState(() {
                _rememberMe = value!;
              });
            }),
        const Text('Lembrar Login'),
        Checkbox(
            value: _accessWithBiometry,
            onChanged: (value) {
              setState(() {
                _accessWithBiometry = value!;
              });
            }),
        const Text('Utilizar Biometria'),
      ],
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () async {
        var result = await _loginPageController.verifyLogin('luis', '12345');
        result.fold((l) => print(l), (r) => print(r));
      },
      child: const Text(
        'Entrar',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildGoogleButton() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: Image.asset(
          'assets/images/google.png',
          scale: 10,
        ),
        onPressed: () {},
      ),
    );
  }
}
