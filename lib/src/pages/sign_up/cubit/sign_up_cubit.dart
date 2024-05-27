import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/token_dto.dart';
import 'package:your_app_test/src/domain/common/result.dart';
import 'package:your_app_test/src/domain/repository/api_repository.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  ApiRepository apiRepository;

  TextEditingController emailController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  SignUpCubit(this.apiRepository) : super(const SignUpState.initial());
  Future<void> signUp() async {
    emit(const _Loading());

    final Result<BaseResponseDto<TokenDto>> result = await apiRepository.signUp(
        confirmPassword: confirmPasswordController.text,
        email: emailController.text,
        userName: userNameController.text,
        password: passwordController.text);
    result.when(
      success: (data) {
        emit(_Loaded(data.data!));
      },
      failed: (error) {
        emit(_Error(error.message));
      },
    );
    return;
  }
}
