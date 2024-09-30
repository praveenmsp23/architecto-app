import 'package:architecto/models/common.dart';
import 'package:architecto/models/organization.dart';
import 'package:architecto/store/store.dart';
import 'package:architecto/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _loading = true;
  bool get loading => _loading;

  User? _user;
  User? get user => _user;

  Organization? _organization;
  Organization? get organization => _organization;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((u) async {
      this._user = u;
    });
    _firebaseAuth.userChanges().listen((u) async {
      this._user = u;
    });
    validate();
  }

  Future<void> validate() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.currentUser?.reload();
      await _fetchUserOrganization();
    }
    this._loading = false;
    notifyListeners();
  }

  Future<void> _fetchUserOrganization() async {
    this._organization =
        await Store.organizationStore.getUserOrganization(_user!.uid);
  }

  Future<Result> signUp(String name, String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser?.updateProfile(displayName: name);
      await _firebaseAuth.currentUser?.reload();
      Result result = await sendVerificationEmail();
      if (result.success) {
        SnackBar().successMessage(result.message);
      }
      if (!result.success) {
        SnackBar().errorMessage(result.message);
      }
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
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      this._user = cred.user;
      await validate();
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

  Future<Result> isEmailVerified() async {
    _firebaseAuth.currentUser?.reload();
    if (_firebaseAuth.currentUser!.emailVerified) {
      await validate();
      return Result(true, "Email verified");
    } else {
      return Result(false, "Email not verified");
    }
  }

  Future<Result> sendVerificationEmail() async {
    await _firebaseAuth.currentUser?.reload();
    if (_firebaseAuth.currentUser!.emailVerified) {
      return Result(true, "Email already verified");
    }
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
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

  Future<Result> createOrganization(String name,
      [String? about, String? address]) async {
    try {
      await Store.organizationStore.createOrganization(
          name,
          _firebaseAuth.currentUser!.uid,
          _firebaseAuth.currentUser!.email ?? "",
          about,
          address);
      await validate();
    } catch (e) {
      return Result(false, e.toString());
    }
    return Result(true, "Organization created successfully");
  }

  Future<void> signOut() async {
    _user = null;
    _organization = null;
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
