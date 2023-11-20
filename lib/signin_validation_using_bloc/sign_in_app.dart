import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_bloc.dart';
import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInApp extends StatelessWidget {
  const SignInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'SignInApp Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => SignInBloc(), child: SignInScreen()),
      ),
    );
  }
}
