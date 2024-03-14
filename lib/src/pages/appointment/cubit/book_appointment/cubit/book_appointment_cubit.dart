import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';

import 'package:new_beginnings/src/domain/common/result.dart';

part 'book_appointment_state.dart';
part 'book_appointment_cubit.freezed.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  ApiRepository apiRepository;

  BookAppointmentCubit(this.apiRepository)
      : super(const BookAppointmentState.initial());

  void bookAppointment({
    required String date,
    required String paymentType,
    required int price,
    required String requestType,
    required String serviceName,
    required String technologyType,
    required String timeSlot,
    required String method,
  }) async {
    emit(const _Loading());
    final Result<BaseResponseDto> result = await apiRepository.bookAppointment(
        appointmenDate: date,
        paymentType: paymentType,
        price: price,
        requestType: requestType,
        serviceName: serviceName,
        technologyType: technologyType,
        timeSlot: timeSlot,
        method: method);
    result.when(success: (data) {
      emit(_Loaded(data));
    }, failed: (error) {
      emit(_Error(error.message));
    });
  }
}
