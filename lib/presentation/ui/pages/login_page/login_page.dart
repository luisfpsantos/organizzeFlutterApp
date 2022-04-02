import 'package:flutter/material.dart';
import 'package:organizze_app/data/datasources/firebase/get_user_in_database_datasource_imp.dart';
import 'package:organizze_app/data/datasources/firebase/verify_login_with_databse_datasource_imp.dart';
import 'package:organizze_app/data/datasources/local/get_auth_biometry_datasource_imp.dart';
import 'package:organizze_app/data/datasources/local/get_login_options_local_datasource_imp.dart';
import 'package:organizze_app/data/datasources/local/save_login_options_local_datasource_imp.dart';
import 'package:organizze_app/data/repositories/get_auth_biometry_repository_imp.dart';
import 'package:organizze_app/data/repositories/get_login_options_local_repository_imp.dart';
import 'package:organizze_app/data/repositories/get_user_in_database_repository_imp.dart';
import 'package:organizze_app/data/repositories/save_login_options_local_repository_imp.dart';
import 'package:organizze_app/data/repositories/verify_login_with_database_repository_imp.dart';
import 'package:organizze_app/domain/errors/get_user_in_database_errors.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';
import 'package:organizze_app/domain/usecases/get_auth_biometry/get_auth_biometry_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/login_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _accessWithBiometry = false;

  String? userError;
  String? passwordError;

  bool _isLoading = false;
  bool _readingOnly = false;

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
    SaveLoginOptionsLocalUsecaseImp(
      SaveLoginOptionsLocalRepositoryImp(
        SaveLoginOptionsLocalDatasourceImp(),
      ),
    ),
    GetLoginOptionsLocalUsecaseImp(
      GetLoginOptionsLocalRepositoryImp(
        GetLoginOptionsLocalDatasourceImp(),
      ),
    ),
    GetAuthBiometryUsecaseImp(
      GetAuthBiometryRepositoryImp(
        GetAuthBiometryDatasourceImp(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _loginPageController.getLoginOptionsLocal().then((response) => {
          response.fold(
            (exception) => {},
            (result) => {
              setState(() {
                if (result['accessWithBiometry']) {
                  _accessWithBiometry = result['accessWithBiometry'];
                }
                _userTextController.text = result['user'];
                _passwordTextController.text = result['password'];
                _readingOnly = true;
                _rememberMe = true;
              })
            },
          ),
        });
  }

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
      readOnly: _readingOnly,
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
      readOnly: _readingOnly,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: _rememberMe,
            onChanged: (value) {
              setState(() {
                if (!value!) {
                  _readingOnly = false;
                }
                _rememberMe = value;
              });
            }),
        const Text('Lembrar Login'),
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
      onPressed: () {
        _validLogin();
      },
      child: _isLoading
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

  void _validLogin() {
    setState(() {
      _readingOnly = true;
      _isLoading = true;
      userError = null;
      passwordError = null;
    });

    void _getUser() async {
      var user = await _loginPageController
          .getUserInDatabase(_userTextController.text);

      user.fold(
        (exception) => {
          if (exception is GetUserNotFound ||
              exception is GetUserDatasourceError)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao Logar')),
              )
            },
          setState(() {
            _isLoading = false;
            _readingOnly = false;
          })
        },
        (result) => {
          if (_rememberMe)
            {
              _loginPageController.saveLoginOptionsLocal({
                'user': _userTextController.text,
                'password': _passwordTextController.text,
                'accessWithBiometry': _accessWithBiometry
              }),
              setState(() {
                _isLoading = false;
                _readingOnly = false;
              }),
              Navigator.pushReplacementNamed(
                context,
                HomePage.routName,
                arguments: result,
              )
            }
          else
            {
              _loginPageController.saveLoginOptionsLocal({}),
              setState(() {
                _isLoading = false;
                _readingOnly = false;
              }),
              Navigator.pushReplacementNamed(
                context,
                HomePage.routName,
                arguments: result,
              )
            }
        },
      );
    }

    void _verifyUserAndPassword() async {
      var verifyLogin = await _loginPageController.verifyLogin(
          _userTextController.text, _passwordTextController.text);

      verifyLogin.fold(
        (exception) => {
          setState(() {
            if (exception is InvalidUser || exception is UserNotfound) {
              userError = 'Usúario Incorreto';
            }
            if (exception is InvalidPassword) {
              passwordError = 'Senha Incorreta';
            }
            if (exception is ErrorDataSource) {
              passwordError = 'Contatar Administrador';
            }
            _isLoading = false;
            _readingOnly = false;
          })
        },
        (result) => {
          if (result)
            {_getUser()}
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuario não Permitido')),
              ),
              setState(() {
                _isLoading = false;
                _readingOnly = false;
              })
            }
        },
      );
    }

    _verifyUserAndPassword();
  }
}
