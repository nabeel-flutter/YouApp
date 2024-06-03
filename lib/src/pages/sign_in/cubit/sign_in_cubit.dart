import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_finder/src/data/dto/base_response_dto.dart';
import 'package:e_finder/src/data/dto/token_dto.dart';
import 'package:e_finder/src/domain/common/result.dart';
import 'package:e_finder/src/domain/repository/api_repository.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  ApiRepository apiRepository;

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  SignInCubit(this.apiRepository) : super(const _Initial());

  Future<void> signIn() async {
    emit(const _Loading());

    final Result<BaseResponseDto<TokenDto>> result = await apiRepository.signIn(
        email: emailController.text, password: passwordController.text);
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

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;

  const factory SignInState.loading() = _Loading;

  const factory SignInState.error(String message) = _Error;

  const factory SignInState.loaded(TokenDto token) = _Loaded;
}
