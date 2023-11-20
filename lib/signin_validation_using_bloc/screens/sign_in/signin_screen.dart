import 'dart:ffi';

import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_bloc.dart';
import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_event.dart';
import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // BlocListener<SignInBloc, SignInState>(
    //   listener: (context,state) {
    //     if(state is SignInInitialState)
    //     emailController.text =
    //   },
    // );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In form"),
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Enter email"),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Enter password"),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              return (state is SignInLoadingState)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                          color: (state is SignInValidState)
                              ? Colors.blue
                              : Colors.grey,
                          onPressed: () {
                            if (state is SignInValidState) {
                              BlocProvider.of<SignInBloc>(context).add(
                                  SignInSubmittedEvent(emailController.text,
                                      passwordController.text));
                            }
                          },
                          child: const Text("Sign In")),
                    );
            }),
          ]),
        ));
  }
}
