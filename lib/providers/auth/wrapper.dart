import 'package:architecto/pages/home.dart';
import 'package:architecto/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if (auth.user == null) {
      return WelcomePage();
    } else {
      return HomePage();
    }
  }
}
