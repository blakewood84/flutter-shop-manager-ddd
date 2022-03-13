import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_v2/application/auth/auth_cubit.dart';
import 'package:mobile_app_v2/presentation/screens/client_search_screen/client_search_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AuthSignedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ClientSearchScreen()));
        }
        if(state is AuthSignedOut) {
          
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SafeArea(child: SizedBox.shrink()),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(),
              TextFormField()
            ],
          ),
        );
      },
    );
  }
}
