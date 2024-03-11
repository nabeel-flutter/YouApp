import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_beginnings/src/domain/model/user.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileState.initial());
}
