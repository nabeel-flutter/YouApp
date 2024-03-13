import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_beginnings/src/app/app_export.dart';

part 'book_appointment_state.dart';
part 'book_appointment_cubit.freezed.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
    ApiRepository apiRepository;

  BookAppointmentCubit(this.apiRepository) : super(BookAppointmentState.initial());
}
