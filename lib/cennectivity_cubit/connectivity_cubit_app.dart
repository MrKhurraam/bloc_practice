import 'package:bloc_practice/cennectivity_cubit/screens/show_connectivity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_cubit/internet_cubit.dart';

class ConnectivityCubitApp extends StatelessWidget {
  const ConnectivityCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ShowConnectivityScreen(),
      ),
    );
  }
}
