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

  SignUpCubit(this.apiRepository) : super(const SignUpState.initial());
  Future<void> signUp(
      {required String userName,
      required String password,
      required String email,
      required String confirmPassword,
      }) async {
    emit(const _Loading());

    final Result<BaseResponseDto<TokenDto>> result = await apiRepository.signUp(
        confirmPassword: confirmPassword,
        email: email,
        userName:userName ,
        
        password: password);
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
