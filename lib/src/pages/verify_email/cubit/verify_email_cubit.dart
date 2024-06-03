import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_finder/src/data/dto/base_response_dto.dart';
import 'package:e_finder/src/domain/common/result.dart';
import 'package:e_finder/src/domain/repository/api_repository.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.apiRepository)
      : super(const VerifyEmailState.initial());
  ApiRepository apiRepository;
  Future<void> verifyEmail({
    required String email,
  }) async {
    emit(const _Loading());

    final Result<BaseResponseDto> result =
        await apiRepository.verifyEmail(email: email);
    result.when(
      success: (data) {
        emit(_Loaded(data.message ?? "Email send to your account"));
      },
      failed: (error) {
        emit(_Error(error.message));
      },
    );
    return;
  }
}
