import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthFacade {
  
  const IAuthFacade();

  User? getCurrentUserInfo();
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> register({
    required String email,
    required String password,
  });
  Future<void> signOut();
}