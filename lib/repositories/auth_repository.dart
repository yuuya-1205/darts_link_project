import 'package:darts_link_project/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? get currentFirebaseUser => _firebaseAuth.currentUser;
  static AppUser? currentUser;

  static Future<User?> singUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return currentFirebaseUser;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    print('$email ---- $password');
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<dynamic> resetPassword({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  static Future<dynamic> signOut() async {
    await _firebaseAuth.signOut();
  }
}
