import 'package:animate_do/animate_do.dart';
import 'package:architecto/providers/auth/provider.dart';
import 'package:architecto/widgets/button.dart';
import 'package:architecto/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return CupertinoPageScaffold(
      child: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                          fontWeight: FontWeight.w600,
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
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Input(
                  controller: _controller,
                  prefix: Icon(CupertinoIcons.phone),
                  placeholder: "98765 43210",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Button(
                    text: "Sign In",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
