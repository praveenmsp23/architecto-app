import 'package:architecto/models/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? _user;
  User? get user => _user;
  bool get loading => false;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((user) {
      this._user = user;
      notifyListeners();
    });
    _firebaseAuth.userChanges().listen((user) {
      this._user = user;
      notifyListeners();
    });
  }

  Future<Result> signUp(String name, String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user?.updateProfile(displayName: name);
      await user?.reload();
      _user = _firebaseAuth.currentUser;
      notifyListeners();
      return Result(true, 'Sign up successful');
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebase::SignUp::Exception: $e");
      if (e.code == 'email-already-in-use') {
        return Result(false, 'Account already exists');
      } else {
        return Result(false, 'Oops! A Hiccup in the Process');
      }
    } catch (e) {
      debugPrint("Firebase::SignUp::Error: $e");
      return Result(false, e.toString());
    }
  }

  Future<Result> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return Result(true, 'Login successful');
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebase::SignIn::Exception: $e");
      if (e.code == 'invalid-credential') {
        return Result(false, 'Invalid credentials');
      } else {
        return Result(false, 'Oops! A Hiccup in the Process');
      }
    } catch (e) {
      debugPrint("Firebase::SignIn::Error: $e");
      return Result(false, e.toString());
    }
  }

  Future<Result> sendVerificationEmail() async {
    try {
      await user?.sendEmailVerification();
      return Result(true, 'Verification mail sent');
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebase::VerificationEmail::Exception: $e");
      if (e.code == 'too-many-requests') {
        return Result(false, 'Too many requests');
      } else {
        return Result(false, 'Oops! A Hiccup in the Process');
      }
    } catch (e) {
      debugPrint("Firebase::VerificationEmail::Error: $e");
      return Result(false, e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
