import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/data/dto/data_list_dto.dart';
import 'package:new_beginnings/src/data/dto/product_dto.dart';
import 'package:new_beginnings/src/data/dto/token_dto.dart';
import 'package:new_beginnings/src/domain/domain.dart';
import 'package:new_beginnings/src/domain/model/appointment.dart';

import 'package:new_beginnings/src/domain/model/medical_records.dart';
import 'package:new_beginnings/src/pages/doctors/models/team_dto.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';

import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';

abstract class ApiRepository extends Repository {
  ///
  /// get user dashboard overview
  ///
  Future<Result<AnimatedDrawer>> getDashboardOverview();

  ///
  /// get sehatScan history
  ///
  Future<Result<List<LastHealthScan>>> getSehatScanHistory(date);

  ///
  /// get appointments history
  ///
  Future<Result<List<Appointment>>> getPastAppointments(
      String startDate, String endDate);

  ///
  /// get Medical records history
  ///
  Future<Result<List<MedicalRecords>>> getMedicalRecordsHistory();
  Future<Result<List<MedicalRecords>>> getMedicalRecordsHistoryB(
      String a, String b);

  ///
  /// add Medical records
  ///
  Future<Result> addMedicalRecords(
    List<File> filesList,
    List<int> ids,
    String date,
    String fileName,
    bool isInstantConsultationScreen,
  );

  ///
  /// get doctors data
  ///
  // Future<Result<DataList<Doctor>>> getDoctors({required int medicalRecordId});

  ///
  /// add Medical records
  ///
  Future<Result> shareMedicalRecord(
    int doctorId,
    int medicalRecordId,
    bool isFromInstantConsultation,
  );

  ///
  /// delete Medical records
  ///
  Future<Result> deleteMedicalRecord(int medicalRecordId);

  ///
  /// delete Medical record file
  ///
  Future<Result> deleteMedicalRecordFile(int fileId);

  Future<Result> editMedicalRecords(
      List<File> filesList,
      List<int> ids,
      String date,
      String fileName,
      String? medicalRecordId,
      bool isInstantConsultationScreen);

  Future<Result<DataListDto<ProductDto>>> getProducts(int limit);

  Future<Result<BaseResponseDto<ProductDto>>> getProductDetails(int id);

  Future<Result<BaseResponseDto<AppointmentDetailsDto>>>
      getAppointmentDetails();

  Future<Result<BaseResponseDto<TokenDto>>> signIn(
      {required String email, required String password});

  Future<Result<BaseResponseDto<TokenDto>>> signUp(
      {required String lastName,
      required String phone,
      required String firstName,
      required String email,
      required String confirmPassword,
      required String password});

  Future<Result<BaseResponseDto<TokenDto>>> payBill(
      {required String name,
      required String email,
      required String phone,
      required String paymentType,
      required String message,
      required int price});

  Future<Result<BaseResponseDto>> forgetPassword({required String email});

  Future<Result<BaseResponseDto>> verifyEmail({required String email});

  Future<Result<BaseResponseDto<UserDetails>>> getUser();

  Future<Result<BaseResponseDto<TeamDto>>> getTeam();

  Future<Result<BaseResponseDto<LogDetails>>> getLogs();

  Future<Result<BaseResponseDto>> updateUser(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? alternateNumber,
      File? insuranceCardFront,
      File? insuranceCardBack,
      String? insuranceName,
      String? insurancePolicyNumber,
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
      String paymentType});

  Future<Result<BaseResponseDto>> bookAppointment({
    required bool initialPayment,
    required String appointmenDate,
    required String paymentType,
    required String requestType,
    required String serviceName,
    required String timeSlot,
    required String technologyType,
    required int price,
    required String method,
  });
}
