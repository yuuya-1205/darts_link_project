import 'package:darts_link_app/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;
  static AppUser? currentUser;

  static Future<User?> singUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseAuth.currentUser!.sendEmailVerification();

      currentFirebaseUser = userCredential.user;
      return currentFirebaseUser;
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }

  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    currentFirebaseUser = userCredential.user;
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
