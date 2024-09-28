import 'package:architecto/pages/auth/organization.dart';
import 'package:architecto/pages/home.dart';
import 'package:architecto/pages/auth/verify_email.dart';
import 'package:architecto/pages/welcome.dart';
import 'package:architecto/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
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
    if (auth.loading) return;
    if (auth.user == null) {
      Get.to(() => WelcomePage());
    } else if (!auth.user!.emailVerified) {
      Get.to(() => VerifyEmailPage(email: auth.user!.email!));
    } else if (auth.organization == null) {
      Get.to(() => CreateOrganizationPage());
    } else {
      Get.to(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.loading) {
          return PageLoader();
        } else if (authProvider.user == null) {
          return WelcomePage();
        } else if (!authProvider.user!.emailVerified) {
          return VerifyEmailPage(email: authProvider.user!.email!);
        } else if (auth.organization == null) {
          return CreateOrganizationPage();
        } else {
          return HomePage();
        }
      },
    );
  }
}
