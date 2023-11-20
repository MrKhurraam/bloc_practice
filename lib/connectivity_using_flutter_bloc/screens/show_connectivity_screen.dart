import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowConnectivityScreen extends StatelessWidget {
  const ShowConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // it does not make UI but used for functionality
            // BLocListener

            //  builder helps in making UI
            //  BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
            //   if (state is InternetLostState) {
            //     return const Text("Connection lost");
            //   } else if (state is InternetGainedState) {
            //     return const Text("Connected");
            //   } else {
            //     return const Text("Connecting...");
            //   }
            // }),

            BlocConsumer<InternetBloc, InternetState>(
          listener: (BuildContext context, state) {
            if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet not connected"),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet connected"),
                  backgroundColor: Colors.greenAccent,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetLostState) {
              return const Text("Connection lost!");
            } else if (state is InternetGainedState) {
              return const Text("Connected!");
            } else {
              return const Text("Connecting...");
            }
          },
        ),
      ),
    );
  }
}
