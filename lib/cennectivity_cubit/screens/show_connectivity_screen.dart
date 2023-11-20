import 'package:bloc_practice/cennectivity_cubit/internet_cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../internet_cubit/internet_cubit.dart';

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

            BlocConsumer<InternetCubit, InternetState>(
          listener: (BuildContext context, state) {
            if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet not connected"),
                  backgroundColor: Colors.red,
                ),
              );
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text("Internet connected"),
                      ));
            } else if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet connected"),
                  backgroundColor: Colors.greenAccent,
                ),
              );
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        content: Text("No Internet connection"),
                      ));
            }
          },
          builder: (context, state) {
            if (state is InternetLostState) {
              return const Text("Connection lost1!");
            } else if (state is InternetGainedState) {
              return const Text("Connected1!");
            } else {
              return const Text("Connecting.1..");
            }
          },
        ),
      ),
    );
  }
}
