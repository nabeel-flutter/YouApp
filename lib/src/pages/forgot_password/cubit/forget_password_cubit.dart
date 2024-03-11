import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/domain/common/result.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.apiRepository) : super(const ForgetPasswordState.initial());
  ApiRepository apiRepository;
   Future<void> forgetPassword({required String email, }) async {
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
