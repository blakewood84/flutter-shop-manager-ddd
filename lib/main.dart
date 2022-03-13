import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_v2/application/auth/auth_cubit.dart';
import 'package:mobile_app_v2/infrastructure/auth/auth_repository.dart';
import 'package:mobile_app_v2/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caddy Daddys Shop Manager',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (BuildContext context) => AuthCubit(AuthRepository())..getAuthStatus(),
          ),
        ],
        child: const SignInScreen(),
      ),
    );
  }
}