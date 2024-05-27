import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/domain/repository/api_repository.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  ApiRepository apiRepository;
  UpdateProfileCubit(this.apiRepository) : super(UpdateProfileState.initial());

  Future<void> updateProfileCubit() async {
    emit(UpdateProfileState.loading());
    try {
      await apiRepository.updateProfile().then((value) => value.when(
            success: (data) {
              emit(UpdateProfileState.loaded(data));
            },
            failed: (error) {
              emit(UpdateProfileState.error(error.message));
            },
          ));
    } on Exception catch (e) {
      emit(UpdateProfileState.error(e.toString()));
    }
  }
}
