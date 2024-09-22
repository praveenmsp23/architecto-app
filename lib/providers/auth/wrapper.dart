import 'package:architecto/pages/organization.dart';
import 'package:architecto/pages/home.dart';
import 'package:architecto/pages/verify_email.dart';
import 'package:architecto/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthProvider auth = Get.find();

  @override
  void initState() {
    super.initState();
    auth.addListener(_onAuthChange);
  }

  @override
  void dispose() {
    auth.removeListener(_onAuthChange);
    super.dispose();
  }

  void _onAuthChange() {
    if (auth.user == null) {
      Get.to(() => WelcomePage());
    } else if (auth.user!.emailVerified) {
      Get.to(() => VerifyEmailPage(email: auth.user!.email!));
    } else if (auth.user!.tenantId!.isEmpty) {
      Get.to(() => CreateOrganizationPage());
    } else {
      Get.to(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        debugPrint("User: ${authProvider.user}");
        if (authProvider.user == null) {
          return WelcomePage();
        } else if (authProvider.user!.emailVerified) {
          return VerifyEmailPage(email: authProvider.user!.email!);
        } else if (authProvider.user!.tenantId == null ||
            authProvider.user!.tenantId!.isEmpty) {
          return CreateOrganizationPage();
        } else {
          return HomePage();
        }
      },
    );
  }
}
