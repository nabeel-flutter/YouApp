import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/domain/common/result.dart';

part 'appointment_cubit_state.dart';
part 'appointment_cubit_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentCubitState> {
  ApiRepository apiRepository;
  AppointmentCubit(this.apiRepository)
      : super(const AppointmentCubitState.initial());
  int selectedPaymentMode = 0;
  String timeSlot = 'Select Time Slot';
  String selectedDate1 = DateTime.now().toString().split(' ')[0];
  String selectedTime1 = DateTime.now().toString().split(' ')[1];
  List<String> timeSlotList = [
    "60 Minutes",
    "45 Minutes",
    "30 Minutes",
  ];
  String service = 'Select Service';
  List<String> servicesList = [];

  String reasonForAppointment = 'Preferred Method For Service';
  List<String> reasonForAppointmentList = [
    'I Need Primary Care Service',
    "I Don't Need Primary Care Service"
  ];

  void selectDate(DateTime? selectedDate) {
    selectedDate1 = selectedDate.toString().split(' ')[0];
    emit(AppointmentCubitState.selectedDate(selectedDate));
  }

  void selectReasonForAppointment(String? selectedReason) {
    reasonForAppointment = selectedReason!;
    emit(AppointmentCubitState.selectedReasonForAppointment(selectedReason));
  }

  void selectTime(String? selectedTime) {
    selectedTime1 = selectedTime!;
    emit(AppointmentCubitState.selectedTime(selectedTime));
  }

  void selectService(String? selectedService) {
    service = selectedService!;
    selectedService = selectedService;
    emit(AppointmentCubitState.selectedService(selectedService));
  }

  void selectTimeSlot(String? selectedTimeSlot) {
    timeSlot = selectedTimeSlot!;
    emit(AppointmentCubitState.selectedTimeSlot(selectedTimeSlot));
  }

  Future<void> getAppointmentDetails() async {
    emit(const AppointmentCubitState.loading());
    final Result<BaseResponseDto<AppointmentDetailsDto>> result =
        await apiRepository.getAppointmentDetails();
    result.when(
        success: (data) {
          emit(_Loaded(data.data!));
        },
        failed: (error) => emit(_Error(error.message)));
  }

  Future<void> bookAppointment({
    required String selectedDate,
    required String selectedTime,
    required String selectedService,
    required int selectedPaymentMode,
    final String? selectedTimeSlot,
  }) async {
    debugPrint(
      'paymentMode: $selectedPaymentMode   selectedDate: $selectedDate, selectedTime: $selectedTime, selectedService: $selectedService, selectedTimeSlot: $selectedTimeSlot',
    );
    // emit(const AppointmentCubitState.loading());
    return;
  }

  void selectPaymentMode(int? value) {
    selectedPaymentMode = value!;
    emit(AppointmentCubitState.selectedPaymentMode(value));
  }
}
