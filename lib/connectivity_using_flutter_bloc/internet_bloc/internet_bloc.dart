import 'dart:async';

import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_event.dart';
import 'package:bloc_practice/connectivity_using_flutter_bloc/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  StreamSubscription? connectivitySubscription;

  // we provide initial state of bloc in super so that it will be used when bloc will be initialize
  InternetBloc() : super(InternetInitialState()) {
    // below 'on' is a function which state continuously
    on<InternetLostEvent>(
            (InternetLostEvent event, Emitter<InternetState> emit) =>
            emit(InternetLostState()));

    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    Connectivity connectivity = Connectivity();

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          if (result == ConnectivityResult.mobile ||
              result == ConnectivityResult.wifi) {
            add(InternetGainedEvent());
          } else {
            add(InternetLostEvent());
          }
        });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
