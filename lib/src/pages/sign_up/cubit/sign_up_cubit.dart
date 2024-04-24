import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/token_dto.dart';
import 'package:your_app_test/src/domain/common/result.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  ApiRepository apiRepository;

  SignUpCubit(this.apiRepository) : super(const SignUpState.initial());
  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String password,
      required String email,
      required String confirmPassword,
      required String phone}) async {
    emit(const _Loading());

    final Result<BaseResponseDto<TokenDto>> result = await apiRepository.signUp(
        phone: phone,
        confirmPassword: confirmPassword,
        email: email,
        lastName: lastName,
        firstName: firstName,
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
