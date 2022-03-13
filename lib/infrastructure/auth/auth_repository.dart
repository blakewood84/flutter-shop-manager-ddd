import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app_v2/domain/auth/i_auth_facade.dart';

class AuthRepository implements IAuthFacade {

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  User? getCurrentUserInfo() => firebaseAuth.currentUser;

  @override
  Future<void> register({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message);
    }
  }

}

class AuthException implements Exception {
  AuthException(this.message);
  final String? message;
}