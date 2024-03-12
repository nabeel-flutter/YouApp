import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/domain/common/result.dart';
import 'package:new_beginnings/src/domain/model/user.dart';
import 'package:new_beginnings/src/pages/profile/model/userdata_model.dart';

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
        success: (data) => emit(_Loaded(data.data!)),
        failed: (error) => emit(_Error(error.message)));
  }
}
