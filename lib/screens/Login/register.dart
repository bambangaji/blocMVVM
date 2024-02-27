import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:merchant_senbu/utils/color_custom.dart';
import 'package:merchant_senbu/utils/constant.dart';
import 'package:merchant_senbu/utils/custom_text.dart';
import 'package:merchant_senbu/utils/custom_widget.dart';
import 'package:merchant_senbu/utils/cusutom_appbar.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  onRegister() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          back: true, title: "Register", isSearchBar: false),
      resizeToAvoidBottomInset: true,
      backgroundColor: Warna.softWhite,
      body: SizedBox(
        height: fullHeight(context),
        width: fullWidth(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: fullHeight(context) - 130,
              width: fullWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      titleText("Username"),
                      const SizedBox(height: 8),
                      customTextField(
                          controller: nameController,
                          hintText: "JoeStar",
                          minLength: 4,
                          bgColor: Warna.grey),
                      const SizedBox(height: 8),
                      titleText("Email"),
                      const SizedBox(height: 8),
                      customTextField(
                          validator: 1,
                          controller: emailController,
                          hintText: "Email@Test.com",
                          bgColor: Warna.grey),
                      const SizedBox(height: 15),
                      titleText("Password"),
                      const SizedBox(height: 8),
                      customTextField(
                          controller: passwordController,
                          hintText: "Password",
                          inputType: TextInputType.visiblePassword,
                          obsecureText: true,
                          bgColor: Warna.grey),
                      const SizedBox(height: 8),
                      titleText("Re-Type Password"),
                      const SizedBox(height: 8),
                      customTextField(
                          controller: repasswordController,
                          hintText: "Password",
                          inputType: TextInputType.visiblePassword,
                          obsecureText: true,
                          bgColor: Warna.grey)
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: fullWidth(context),
                          child: Padding(
                            padding: EdgeInsets.zero,
                            // padding: EdgeInsets.fromLTRB(
                            //     fullHeight(context) / 15, 10, fullHeight(context) / 15, 0),

                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Warna.moonStone,
                                  side: const BorderSide(
                                      color: Colors.transparent, width: 1.0),
                                ),
                                onPressed: () {
                                  onRegister();
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(color: Warna.softWhite),
                                )),
                          )),
                      SizedBox(
                        width: fullWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            longText("Already have an account?",
                                textColor: Warna.softBlack),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: titleText("  Login",
                                  textColor: Warna.biruTua),
                            ),
                          ],
                        ),
                      )
                    ],
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
