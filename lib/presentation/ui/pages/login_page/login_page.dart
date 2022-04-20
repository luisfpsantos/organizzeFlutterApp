import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/controllers/login_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/home_page/home_page.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_page_checkbox_remeberme_widget.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_page_input_password_widget.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_page_submit_button_widget.dart';
import 'package:provider/provider.dart';
import 'login_page_state/login_page_states.dart';
import 'login_page_widgets/login_page_input_user_widget.dart';
import 'login_page_widgets/login_page_title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final inputUserController = TextEditingController();
  final inputPassowordController = TextEditingController();
  late final LoginPageController _loginPageController;

  @override
  void initState() {
    super.initState();
    _loginPageController = context.read<LoginPageController>();
    _loginPageController.getLoginOptionsLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 245),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginTitleWidget(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: ValueListenableBuilder<LoginPageStates>(
                      valueListenable: _loginPageController.loginPageState,
                      builder: (_, state, __) {
                        if (state is Onloading) {
                          return LoginInputUserWidget(
                            readingOnly: true,
                            controller: inputUserController,
                          );
                        }

                        if (state is OnError) {
                          return LoginInputUserWidget(
                            readingOnly: false,
                            controller: inputUserController,
                            errorText: state.inputUserError,
                          );
                        }

                        if (state is OptionsLoginFounded) {
                          inputUserController.text = state.login['user'];
                          return LoginInputUserWidget(
                            readingOnly: true,
                            controller: inputUserController,
                          );
                        }

                        return LoginInputUserWidget(
                          readingOnly: false,
                          controller: inputUserController,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                    child: ValueListenableBuilder<LoginPageStates>(
                      valueListenable: _loginPageController.loginPageState,
                      builder: (_, state, __) {
                        if (state is Onloading) {
                          return LoginInputPasswordWidget(
                            readingOnly: true,
                            controller: inputPassowordController,
                          );
                        }

                        if (state is OnError) {
                          return LoginInputPasswordWidget(
                            readingOnly: false,
                            controller: inputPassowordController,
                            errorText: state.inputPasswordError,
                          );
                        }

                        if (state is OptionsLoginFounded) {
                          inputPassowordController.text =
                              state.login['password'];
                          return LoginInputPasswordWidget(
                            readingOnly: true,
                            controller: inputPassowordController,
                          );
                        }

                        return LoginInputPasswordWidget(
                          readingOnly: false,
                          controller: inputPassowordController,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                    child: ValueListenableBuilder<LoginPageStates>(
                      valueListenable: _loginPageController.checkbox,
                      builder: (_, state, __) {
                        state as LoginCheckbox;

                        return LoginCheckboxRemembermeWidget(
                          value: state.cheked,
                          onChanged: (value) {
                            if (!value!) {
                              _loginPageController.loginPageState.value =
                                  LoginPageIdle();
                            }
                            _loginPageController.checkbox.value =
                                LoginCheckbox(value);
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: ValueListenableBuilder<LoginPageStates>(
                      valueListenable: _loginPageController.loginPageState,
                      builder: (_, state, __) {
                        if (state is Onloading) {
                          return const CircularProgressIndicator();
                        }

                        return LoginSubmitButtonWidget(
                          onPressed: () async {
                            await _loginPageController.verifyLogin(
                              inputUserController.text,
                              inputPassowordController.text,
                            );
                            doLogin();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  doLogin() async {
    if (_loginPageController.loginPageState.value is UserVerified) {
      await _loginPageController.getUserInDatabase(inputUserController.text);

      if (_loginPageController.loginPageState.value is OnSuccess) {
        var checkbox =
            (_loginPageController.checkbox.value as LoginCheckbox).cheked;

        var loggedUser =
            (_loginPageController.loginPageState.value as OnSuccess).loggedUser;

        if (checkbox) {
          _loginPageController.saveLoginOptionsLocal({
            'user': inputUserController.text,
            'password': inputPassowordController.text,
          });
          Navigator.pushReplacementNamed(context, HomePage.routName,
              arguments: loggedUser);
        } else {
          _loginPageController.saveLoginOptionsLocal({});
          Navigator.pushReplacementNamed(context, HomePage.routName,
              arguments: loggedUser);
        }
      }
    }
  }
}
