import 'package:flutter/material.dart';
import 'package:organizze_app/data/datasources/firebase/get_user_in_database_datasource_imp.dart';
import 'package:organizze_app/data/datasources/firebase/verify_login_with_databse_datasource_imp.dart';
import 'package:organizze_app/data/repositories/get_user_in_database_repository_imp.dart';
import 'package:organizze_app/data/repositories/verify_login_with_database_repository_imp.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase_imp.dart';
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

  String? userError;
  String? passwordError;

  bool isLoading = false;
  bool readingOnly = false;

  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final LoginPageController _loginPageController = LoginPageController(
    VerifyLoginWithDatabaseUsecaseImp(
      VerifyLoginWithDatabaseRepositoryImp(
        VerifyLoginWithDatabaseDatasourceImp(),
      ),
    ),
    GetUserInDatabaseUsecaseImp(
      GetUserInDatabaseRepositoryImp(
        GetUserInDatabaseDatasourceImp(),
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
      controller: _userTextController,
      keyboardType: TextInputType.text,
      readOnly: readingOnly,
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
        errorText: userError,
      ),
    );
  }

  Widget buildInputPass() {
    return TextFormField(
      controller: _passwordTextController,
      obscureText: true,
      keyboardType: TextInputType.text,
      readOnly: readingOnly,
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
        errorText: passwordError,
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
        setState(() {
          readingOnly = true;
          isLoading = true;
          userError = null;
          passwordError = null;
        });
        var verifyLogin = await _loginPageController.verifyLogin(
            _userTextController.text, _passwordTextController.text);

        verifyLogin.fold(
            (exception) => {
                  setState(
                    () => {
                      if (exception is InvalidUser || exception is UserNotfound)
                        {userError = 'Usúario Incorreto'},
                      if (exception is InvalidPassword)
                        {passwordError = 'Senha Incorreta'},
                      if (exception is ErrorDataSource)
                        {passwordError = 'Contatar Administrador'},
                      isLoading = false,
                      readingOnly = false
                    },
                  )
                },
            (result) => {
                  if (result)
                    {
                      _loginPageController
                          .getUser(_userTextController.text)
                          .then(
                            (value) => value.fold(
                              (l) => print(l),
                              (r) => print(r.name),
                            ),
                          ),
                      setState(
                        () => {isLoading = false, readingOnly = false},
                      )
                    }
                  else
                    {
                      setState(() => {
                            passwordError = 'Usuario sem Permissão',
                            isLoading = false,
                            readingOnly = false
                          })
                    }
                });
      },
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 4,
            )
          : const Text(
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
