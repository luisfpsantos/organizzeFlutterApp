import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/controllers/login_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_checkbox_remeberme_widget.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_input_password_widget.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_widgets/login_submit_button_widget.dart';
import 'package:provider/provider.dart';

import 'login_page_state/login_page_states.dart';
import 'login_page_widgets/login_input_user_widget.dart';
import 'login_page_widgets/login_title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            controller: state.inputUserController,
                          );
                        }

                        if (state is OnError) {
                          return LoginInputUserWidget(
                            readingOnly: false,
                            controller: state.inputUserController,
                            errorText: state.inputUserError(),
                          );
                        }

                        if (state is OptionsLoginFounded) {
                          if (state.hasLogin) {
                            state.setInputUserValue();
                            return LoginInputUserWidget(
                              readingOnly: true,
                              controller: state.inputUserController,
                            );
                          } else {
                            return LoginInputUserWidget(
                              readingOnly: false,
                              controller: state.inputUserController,
                            );
                          }
                        }

                        if (state is OnSuccess) {
                          return LoginInputUserWidget(
                            readingOnly: true,
                            controller: state.inputUserController,
                          );
                        }

                        return LoginInputUserWidget(
                          readingOnly: false,
                          controller: state.inputUserController,
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
                            controller: state.inputPassowordController,
                          );
                        }

                        if (state is OnError) {
                          return LoginInputPasswordWidget(
                            readingOnly: false,
                            controller: state.inputPassowordController,
                            errorText: state.inputPasswordError(),
                          );
                        }

                        if (state is OptionsLoginFounded) {
                          if (state.hasLogin) {
                            state.inputPassowordController.text =
                                state.login['password'];
                            return LoginInputPasswordWidget(
                              readingOnly: true,
                              controller: state.inputPassowordController,
                            );
                          } else {
                            return LoginInputPasswordWidget(
                              readingOnly: false,
                              controller: state.inputPassowordController,
                            );
                          }
                        }

                        if (state is OnSuccess) {
                          return LoginInputPasswordWidget(
                            readingOnly: true,
                            controller: state.inputPassowordController,
                          );
                        }

                        return LoginInputPasswordWidget(
                          readingOnly: false,
                          controller: state.inputPassowordController,
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
                              _loginPageController.checkbox.value =
                                  LoginCheckbox(value!);
                            },
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: ValueListenableBuilder<LoginPageStates>(
                      valueListenable: _loginPageController.loginPageState,
                      builder: (_, state, __) {
                        if (state is Onloading) {
                          return const CircularProgressIndicator();
                        }

                        return LoginSubmitButtonWidget(onPressed: () {
                          _loginPageController.verifyLogin(
                              state.inputUserController.text,
                              state.inputPassowordController.text);
                        });
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
}
