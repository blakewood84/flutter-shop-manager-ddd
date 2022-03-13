part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthSignedIn extends AuthState {
  const AuthSignedIn(this.user);
  final User? user;
}

class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}

class AuthError extends AuthState {
  const AuthError(this.message);
  final String? message;
}
