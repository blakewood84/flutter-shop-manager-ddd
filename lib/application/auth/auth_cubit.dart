import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app_v2/infrastructure/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthInitial());

  final AuthRepository _authRepository;

  void getAuthStatus() {
    try {
      final User? user = _authRepository.getCurrentUserInfo();
      if (user == null) {
        emit(const AuthSignedOut());
      } else {
        emit(AuthSignedIn(user));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }

}
