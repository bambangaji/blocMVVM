import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_senbu/blocs/loading_bloc.dart';
import 'package:merchant_senbu/blocs/navigations_bloc.dart';
import 'package:merchant_senbu/services/API/Methode.dart';
import 'package:merchant_senbu/services/API/auth_service.dart';
import 'package:merchant_senbu/utils/ImageLoc.dart';
import 'package:merchant_senbu/utils/color_custom.dart';
import 'package:merchant_senbu/utils/constant.dart';
import 'package:merchant_senbu/utils/custom_text.dart';
import 'package:merchant_senbu/utils/custom_widget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LoginPage extends StatefulWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
  doLogin(BuildContext context) async {
    if (!_formLoginKey.currentState!.validate()) {
      return showToastError();
    }
    BlocProvider.of<LoadingBloc>(context).showLoading(context);
    try {
      final response =
          await onLogin(userNameController.value.text, passwordController.text);
      if (response.status.error == 0) {
        saveLogin(
          response.data!.user.userId,
          response.data!.user.fullName,
          response.data!.user.emailAddress,
          response.data!.user.role,
        );
        return goToDashboard(context);
      }
      showToastError();
    } catch (e) {
      showToastError();
    } finally {
      resetFormLogin();
      BlocProvider.of<LoadingBloc>(context).hideLoading(context);
    }
  }

  resetFormLogin() {
    _formLoginKey.currentState!.reset();
    userNameController.text = "";
    passwordController.text = "";
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Warna.biru2,
      body: SingleChildScrollView(
        child: SizedBox(
          height: fullHeight(context),
          width: fullWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Image.asset(ImageLoc.logoLoc),
                  ),
                ),
              ),
              SizedBox(
                  width: fullWidth(context),
                  child: Padding(
                    padding: EdgeInsets.all(fullWidth(context) / 15),
                    child: Form(
                      key: widget._formLoginKey,
                      child: Column(
                        children: [
                          customTextField(
                              controller: widget.userNameController,
                              hintText: "Email",
                              minLength: 4,
                              bgColor: Warna.grey),
                          SizedBox(height: fullHeight(context) / 25),
                          customTextField(
                              controller: widget.passwordController,
                              hintText: "Password",
                              inputType: TextInputType.visiblePassword,
                              obsecureText: true,
                              bgColor: Warna.grey),
                          SizedBox(height: fullHeight(context) / 100),
                          SizedBox(
                            width: fullWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child: titleText("Forgot Password ?",
                                        textColor: Warna.kuning)),
                              ],
                            ),
                          ),
                          SizedBox(height: fullHeight(context) / 45),
                          SizedBox(
                            width: fullWidth(context),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Warna.biru,
                                  side: const BorderSide(
                                      color: Colors.transparent, width: 1.0),
                                ),
                                onPressed: () => widget.doLogin(context),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Warna.softWhite),
                                )),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                longText("Don't have an account?",
                                    textColor: Warna.softWhite),
                                GestureDetector(
                                  onTap: () => goToRegister(context),
                                  child: titleText("  Register Now",
                                      textColor: Warna.kuning),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
