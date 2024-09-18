import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
