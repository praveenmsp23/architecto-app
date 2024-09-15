import 'package:animate_do/animate_do.dart';
import 'package:architecto/config/config.dart';
import 'package:architecto/pages/login.dart';
import 'package:architecto/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      Config.appName,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    "Architecto is a mobile app designed to manage labor attendance, track site stock, and maintain essential details for construction projects.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            FadeIn(
              delay: const Duration(milliseconds: 1000),
              child: Lottie.asset(
                'assets/lottie/buildings.json',
                fit: BoxFit.fitWidth,
                repeat: false,
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Button(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
