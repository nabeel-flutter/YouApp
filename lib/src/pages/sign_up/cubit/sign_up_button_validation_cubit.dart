import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_finder/main.dart';
import 'package:e_finder/src/pages/sign_up/cubit/sign_up_cubit.dart';
part 'sign_up_button_validation_state.dart';
part 'sign_up_button_validation_cubit.freezed.dart';

class SignUpButtonValidationCubit extends Cubit<SignUpButtonValidationState> {
  SignUpButtonValidationCubit() : super(SignUpButtonValidationState.initial());

  void checkIsValidate() {
    if (BlocProvider.of<SignUpCubit>(
                navigationService!.navigatorKey.currentContext!)
            .emailController
            .text
            .isNotEmpty &&
        BlocProvider.of<SignUpCubit>(
                navigationService!.navigatorKey.currentContext!)
            .passwordController
            .text
            .isNotEmpty &&
        BlocProvider.of<SignUpCubit>(
                navigationService!.navigatorKey.currentContext!)
            .confirmPasswordController
            .text
            .isNotEmpty &&
        BlocProvider.of<SignUpCubit>(
                navigationService!.navigatorKey.currentContext!)
            .userNameController
            .text
            .isNotEmpty) {
      emit(SignUpButtonValidationState.enabled());
    } else {
      emit(SignUpButtonValidationState.disabled());
    }
  }
}
