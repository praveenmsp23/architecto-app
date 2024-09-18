import 'package:animate_do/animate_do.dart';
import 'package:architecto/extensions/theme.dart';
import 'package:architecto/pages/signup.dart';
import 'package:architecto/widgets/button.dart';
import 'package:architecto/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool showPassword = false;

  String emailError = "";
  String passwordError = "";

  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  void handleSignIn() {
    if (_emailCont.value.text == "")
      setState(() {
        emailError = "Email is required";
      });
    if (_passwordCont.value.text == "")
      setState(() {
        passwordError = "Password is required";
      });
    if (!GetUtils.isEmail(_emailCont.value.text)) {
      setState(() {
        emailError = "Invalid email address";
      });
    }
  }

  void handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void _onEmailChange() {
    setState(() {
      emailError = "";
    });
  }

  void _onPasswordChange() {
    setState(() {
      passwordError = "";
    });
  }

  @override
  void initState() {
    super.initState();
    _emailCont.addListener(_onEmailChange);
    _emailCont.addListener(_onPasswordChange);
  }

  @override
  void dispose() {
    _emailCont.removeListener(_onEmailChange);
    _passwordCont.removeListener(_onPasswordChange);
    _emailCont.dispose();
    _passwordCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInRight(
                    delay: const Duration(microseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Let's sign you in.",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(microseconds: 200),
                    child: Text(
                      "Welcome back! \nYou've been missed",
                      style: TextStyle(
                        fontSize: 36,
                        height: 1.25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Input(
                    controller: _emailCont,
                    error: emailError,
                    label: "Email",
                    type: TextInputType.emailAddress,
                    placeholder: "name@example.com",
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Input(
                    controller: _passwordCont,
                    error: passwordError,
                    label: "Password",
                    type: TextInputType.text,
                    obscureText: !showPassword,
                    suffix: GestureDetector(
                      onTap: () {
                        handleShowPassword();
                      },
                      child: Icon(
                        showPassword
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                      ),
                    ),
                    placeholder: "Password",
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  child: Button(
                    text: "Sign In",
                    onPressed: () {
                      handleSignIn();
                    },
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: context.secondaryTextColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Button(
                          text: "Sign Up",
                          size: ButtonSize.small,
                          variant: ButtonVariant.link,
                          onPressed: () {
                            Get.to(() => SignupPage());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
