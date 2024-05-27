import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/domain/repository/api_repository.dart';

part 'get_profile_state.dart';
part 'get_profile_cubit.freezed.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  ApiRepository apiRepository;
  
  GetProfileDto? profileData;
  GetProfileCubit(this.apiRepository) : super(GetProfileState.initial());

  Future<void> getProfile() async {
    emit(GetProfileState.loading());
    try {
      await apiRepository.getProfile().then((value) => value.when(
            success: (data) {
              profileData = data;
              emit(GetProfileState.loaded(data));
            },
            failed: (error) {
              emit(GetProfileState.error(error.message));
            },
          ));
    } on Exception catch (e) {
      emit(GetProfileState.error(e.toString()));
    }
  }
}
