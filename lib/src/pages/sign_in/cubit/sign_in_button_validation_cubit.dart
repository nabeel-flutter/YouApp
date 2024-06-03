import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_finder/main.dart';
import 'package:e_finder/src/pages/sign_in/cubit/sign_in_cubit.dart';

part 'sign_in_button_validation_state.dart';
part 'sign_in_button_validation_cubit.freezed.dart';

class SignInButtonValidationCubit extends Cubit<SignInButtonValidationState> {
  SignInButtonValidationCubit() : super(SignInButtonValidationState.initial());

  void checkIsValidate() {
    if (BlocProvider.of<SignInCubit>(
                navigationService!.navigatorKey.currentContext!)
            .emailController
            .text
            .isNotEmpty &&
        BlocProvider.of<SignInCubit>(
                navigationService!.navigatorKey.currentContext!)
            .passwordController
            .text
            .isNotEmpty) {
      emit(SignInButtonValidationState.enabled());
    } else {
      emit(SignInButtonValidationState.disabled());
    }
  }
}
