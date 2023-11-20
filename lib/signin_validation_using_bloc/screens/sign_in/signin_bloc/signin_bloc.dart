import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_event.dart';
import 'package:bloc_practice/signin_validation_using_bloc/screens/sign_in/signin_bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });

    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length <= 6) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SignInValidState());
      }
    });
  }
}
