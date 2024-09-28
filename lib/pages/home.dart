import 'package:architecto/providers/auth/provider.dart';
import 'package:architecto/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider _auth = Get.find();
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Button(
            text: "Logout",
            onPressed: () => _auth.signOut(),
          ),
        ),
      ),
    );
  }
}
