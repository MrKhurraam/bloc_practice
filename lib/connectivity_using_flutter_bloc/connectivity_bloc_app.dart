import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/show_connectivity_screen.dart';

class ConnectivityBlocApp extends StatelessWidget {
  const ConnectivityBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
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
