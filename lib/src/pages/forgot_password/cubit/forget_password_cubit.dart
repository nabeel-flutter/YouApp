import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_finder/src/data/dto/base_response_dto.dart';
import 'package:e_finder/src/domain/common/result.dart';
import 'package:e_finder/src/domain/repository/api_repository.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.apiRepository)
      : super(const ForgetPasswordState.initial());
  ApiRepository apiRepository;
  Future<void> forgetPassword({
    required String email,
  }) async {
    emit(const _Loading());

    final Result<BaseResponseDto> result =
        await apiRepository.forgetPassword(email: email);
    result.when(
      success: (data) {
        emit(_Loaded(data.message!));
      },
      failed: (error) {
        emit(_Error(error.message));
      },
    );
    return;
  }
}
