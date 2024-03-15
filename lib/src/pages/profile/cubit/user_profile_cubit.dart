import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/domain/common/result.dart';
import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  ApiRepository apiRepository;

  UserProfileCubit(this.apiRepository)
      : super(const UserProfileState.initial());

  Future<void> getUserData() async {
    emit(const _Loading());
    final Result<BaseResponseDto<UserDetails>> result =
        await apiRepository.getUser();
    result.when(
        success: (data) {
          emit(_Loaded(data.data!));
        },
        failed: (error) => emit(_Error(error.message)));
  }

  Future<void> updateUser(
      {String? email,
      String? firstName,
      String? lastName,
      String? phone,
      String? alternatePhone,
      File? avatar,
      String? country,
      String? state,
      String? city,
      String? zipCode,
      String? address,
      String? dob,
      String? gender,
      String? ssn,
      String? suffix,
      String? prefferdLocation,
      File? insuranceCardFront,
      File? insuranceCardBack,
      String? insuranceName,
      String? insurancePoilcyNumber,
      required String paymentType}) async {
    emit(const _Loading());
    await apiRepository.updateUser(
        insuranceCardBack: insuranceCardBack,
        insuranceCardFront: insuranceCardFront,
        address: address,
        alternateNumber: alternatePhone,
        avatar: avatar,
        city: city,
        country: country,
        dob: dob,
        gender: gender,
        insuranceName: insuranceName,
        insurancePolicyNumber: insurancePoilcyNumber,
        prefferdLocation: prefferdLocation,
        ssn: ssn,
        suffix: suffix,
        state: state,
        zipCode: zipCode,
        email: email,
        firstName: firstName,
        lastName: lastName,
        paymentType: paymentType,
        phone: phone);
    final Result<BaseResponseDto<UserDetails>> result =
        await apiRepository.getUser();
    result.when(
        success: (data) {
          emit(_Loaded(data.data!));
        },
        failed: (error) => emit(_Error(error.message)));
  }
}
