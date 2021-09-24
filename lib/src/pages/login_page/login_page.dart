import 'package:dartz/dartz.dart' as dartz;
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:empresas_flutter/src/service/service_locator.dart';
import 'package:empresas_flutter/src/stores/user_store/auth_store.dart';
import 'package:empresas_flutter/src/widgets/shared_widget/button_shared.dart';
import 'package:empresas_flutter/src/widgets/shared_widget/text_field_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../search_page.dart';
import 'widgets/text_field_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode? _focusNodeEmail;
  FocusNode? _focusNodePassword;

  TextEditingController? _txtEmail;
  TextEditingController? _txtPassword;

  AuthStore? _authStore;

  @override
  void initState() {
    super.initState();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();

    _txtEmail = TextEditingController();
    _txtPassword = TextEditingController();

    _authStore = locator.get<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _focusNodeEmail?.unfocus();
        _focusNodePassword?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: -size.height * 0.1,
                      left: -size.width * 0.3,
                      right: -size.width * 0.3,
                      child: Container(
                        height: 400,
                        child: ClipOval(
                          child: Image.asset("asset/images/fundo_login.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/icons/logo.png",
                            width: 60,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Seja bem vindo ao empresas!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        "Email",
                        style: TextStyle(
                            color: _authStore!.isValidEmail
                                ? Colors.black
                                : Colors.red),
                      );
                    }),
                    SizedBox(
                      height: 4,
                    ),
                    SharedTextField(
                        textEditingController: _txtEmail!,
                        focusNode: _focusNodeEmail!,
                        onChanged: (value) =>
                            _authStore?.validateEmail(value)),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Senha"),
                    SizedBox(
                      height: 4,
                    ),
                    Observer(builder: (_) {
                      return TextFieldPassword(
                        textEditingController: _txtPassword!,
                        suffixIcon: _authStore!.hidPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        focusNode: _focusNodePassword!,
                        isPassword: _authStore!.hidPassword,
                        alterPasswordView: () => _authStore?.alterPasswordView,
                      );
                    }),
                    Observer(builder: (_) {
                      
                      return Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                             _authStore?.error?.message??"",
                            style: TextStyle(color: Colors.red),
                          ));
                    }),
                    SizedBox(
                      height: 74,
                    ),
                    Observer(builder: (_) {
                      return SharedButton(
                        isAnimating: _authStore!.isLoading,
                        onTaped: () {
                          _authStore
                              ?.login(
                                  params: LoginParams(
                                      email: _txtEmail!.text,
                                      password: _txtPassword!.text))
                              .then((value) {
                            if (value is dartz.Right) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation, animation2) =>
                                            SearchPage(),
                                    transitionsBuilder: (context, animation,
                                            animation2, child) =>
                                        FadeTransition(
                                            opacity: animation, child: child),
                                    transitionDuration: Duration(seconds: 1),
                                  ),
                                  (Route<dynamic> route) => false);
                            }
                          });
                        },
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
