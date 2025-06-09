import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:penger/components/button.dart';
import 'package:penger/components/checkbox_input.dart';
import 'package:penger/components/textinput.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/app_routes.dart';
import 'package:penger/resources/appstyles.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final namefocus = FocusNode();
  final passwordfocus = FocusNode();
  final emailfocus = FocusNode();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolors.bgColor,
        appBar: AppBar(
          backgroundColor: Appcolors.bgColor,
          title: Text('Sign Up', style: Appstyles.bartitle()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(height: 24),
                Inputcomponent(
                  lable: 'Name',
                  textEdcontroller: nameController,
                  onsubmited: (value) =>
                      FocusScope.of(context).requestFocus(emailfocus),
                  docusNode: namefocus,
                  textInputAction: TextInputAction.next,
                  isrequired: true,
                ),
                const SizedBox(height: 16),
                Inputcomponent(
                  lable: 'E-mail',
                  textEdcontroller: emailController,
                  docusNode: emailfocus,
                  onsubmited: (value) =>
                      FocusScope.of(context).requestFocus(passwordfocus),
                  textInputAction: TextInputAction.next,
                  isrequired: true,
                ),
                const SizedBox(height: 16),
                Inputcomponent(
                  lable: 'Password',
                  isPassword: true,
                  textEdcontroller: passwordController,
                  onsubmited: (value) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.done,
                  docusNode: passwordfocus,
                  isrequired: true,
                ),
                const SizedBox(height: 16),
                // ignore: avoid_print
                CheckboxInput(
                  lable: Text.rich(
                    style: Appstyles.medium(size: 14),
                    TextSpan(
                      text: 'By Signing up, you agree',
                      children: [
                        WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(
                          text: 'to the Terms of Service and Privacy Policy',
                          style: Appstyles.medium(
                            size: 14,
                            color: Appcolors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  value: false,
                  onChanged: (value) {
                    if (kDebugMode) {
                      print("===============================");
                      print(value);
                    }
                  },
                ),
                const SizedBox(height: 24),
                Buttoncomponent(
                  label: 'Sign Up',
                  buttonType: 'primary',
                  onPressed: () => signup(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Or with',
                  style: Appstyles.medium(
                    color: Appcolors.light20,
                    size: 14,
                    weight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Buttoncomponent(
                  label: 'Sign Up with google',
                  buttonType: 'light',
                  icon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset('assets/images/google-icon.png'),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.signup),
                ),
                const SizedBox(height: 24),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: Appstyles.medium(size: 16),
                  TextSpan(
                    text: 'Alredy have an account?',
                    children: [
                      WidgetSpan(child: const SizedBox(width: 8)),
                      TextSpan(
                        text: 'Login',
                        style:
                            Appstyles.medium(
                              size: 16,
                              color: Appcolors.primaryColor,
                              weight: FontWeight.bold,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Appcolors.primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    FocusScope.of(context).unfocus();
    if (!formkey.currentState!.validate()) return;
    Future.delayed( Duration( seconds:4 ) , ()=>{
setState(() {
  isLoading=false;
})}
);
    
    if (kDebugMode) {
      print("sucsess");
    }

  }
}
