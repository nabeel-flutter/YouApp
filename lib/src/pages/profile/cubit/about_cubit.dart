import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_state.dart';
part 'about_cubit.freezed.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState.initial());

  bool isEdit = false;

  void swichState() {
    isEdit = !isEdit;
    if (isEdit == true) {
      emit(AboutState.editable());
    } else {
      emit(AboutState.view());
    }
  }
}
