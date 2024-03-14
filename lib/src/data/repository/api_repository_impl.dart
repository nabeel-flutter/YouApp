import 'dart:io';
import 'package:logger/logger.dart';
import 'package:new_beginnings/src/data/common/object_mapper.dart';
import 'package:new_beginnings/src/data/datasource/api/at_care_api.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/data/dto/data_list_dto.dart';
import 'package:new_beginnings/src/data/dto/product_dto.dart';
import 'package:new_beginnings/src/data/dto/token_dto.dart';
import 'package:new_beginnings/src/domain/domain.dart';
import 'package:new_beginnings/src/domain/model/appointment.dart';
import 'package:new_beginnings/src/domain/model/data_list.dart';
import 'package:new_beginnings/src/domain/model/docotor.dart';
import 'package:new_beginnings/src/domain/model/medical_records.dart';
import 'package:new_beginnings/src/pages/appointment/models/appointments_details_dto.dart';
import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';

class ApiRepositoryImpl extends ApiRepository {
  final SoftTechTestApi softTechTestApi;
  final ObjectMapper objectMapper;
  final Logger logger;

  ApiRepositoryImpl({
    required this.softTechTestApi,
    required this.objectMapper,
    required this.logger,
  });

  @override
  Future<Result<AnimatedDrawer>> getDashboardOverview() async {
    try {
      final response = await softTechTestApi.getDashBoardOverview();
      return Result.success(objectMapper.toDashboardOverview(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto<ProductDto>>> getProductDetails(int id) async {
    try {
      final response = await softTechTestApi.getProductDetails(id);
      return Result.success(objectMapper.toGetProductDetail(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<DataListDto<ProductDto>>> getProducts(limit) async {
    try {
      final response = await softTechTestApi.getProducts(limit);
      return Result.success(objectMapper.toGetProducts(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<List<LastHealthScan>>> getSehatScanHistory(date) async {
    try {
      final response = await softTechTestApi.getSehatScanHistory(date);
      return Result.success(objectMapper.toSehatScanHistory(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<List<MedicalRecords>>> getMedicalRecordsHistory() async {
    try {
      final response = await softTechTestApi.getMedicalRecordsHistory();
      return Result.success(objectMapper.toMedicalRecordsHistory(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<List<Appointment>>> getPastAppointments(
      String startDate, String endDate) async {
    try {
      final response = await softTechTestApi.getPastAppointments(
          endDate: endDate, startDate: startDate);
      return Result.success(objectMapper.toPastAppointments(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result> addMedicalRecords(
    List<File> filesList,
    List<int> ids,
    String date,
    String fileName,
    bool isInstantConsultationScreen,
  ) async {
    try {
      await softTechTestApi.addMedicalRecords(
          filesList, ids, date, fileName, isInstantConsultationScreen);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result> editMedicalRecords(
      List<File> filesList,
      List<int> ids,
      String date,
      String fileName,
      String? medicalRecordId,
      bool isInstantConsultationScreen) async {
    try {
      await softTechTestApi.editMedicalRecords(filesList, ids, date, fileName,
          medicalRecordId, isInstantConsultationScreen);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<DataList<Doctor>>> getDoctors(
      {required int medicalRecordId}) async {
    try {
      final response =
          await softTechTestApi.getDoctors(medicalRecordId: medicalRecordId);
      return Result.success(objectMapper.toDoctorsList(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result> shareMedicalRecord(
      int doctorId, int medicalRecordId, bool isFromInstantConsultation) async {
    try {
      await softTechTestApi.shareMedicalRecord(doctorId, medicalRecordId,
          isFromInstantConsultation: isFromInstantConsultation);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result> deleteMedicalRecord(int medicalRecordId) async {
    try {
      await softTechTestApi.deleteMedicalRecord(medicalRecordId);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result> deleteMedicalRecordFile(int fileId) async {
    try {
      await softTechTestApi.deleteMedicalRecordFile(fileId);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  Future<Result> downloadMedicalRecord(int medicalRecordId) async {
    try {
      await softTechTestApi.deleteMedicalRecord(medicalRecordId);
      return Result.success("");
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<List<MedicalRecords>>> getMedicalRecordsHistoryB(
      String a, String b) async {
    try {
      final response = await softTechTestApi.getMedicalRecordsHistoryB(a, b);
      return Result.success(objectMapper.toMedicalRecordsHistory(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto<TokenDto>>> signIn(
      {required String email, required String password}) async {
    try {
      final response =
          await softTechTestApi.signIn(password: password, email: email);
      return Result.success(objectMapper.toSignIn(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto<TokenDto>>> signUp(
      {required String phone,
      required String lastName,
      required String firstName,
      required String email,
      required String confirmPassword,
      required String password}) async {
    try {
      final response = await softTechTestApi.signUp(
        confirmPassword: confirmPassword,
        email: email,
        phone: phone,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );
      return Result.success(objectMapper.toSignUp(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> forgetPassword(
      {required String email}) async {
    try {
      final response = await softTechTestApi.forgetPassword(
        email: email,
      );
      return Result.success(objectMapper.toforgetPassword(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> verifyEmail({required String email}) async {
    try {
      final response = await softTechTestApi.verifyEmail(
        email: email,
      );
      return Result.success(objectMapper.toVerifyEmail(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto<UserDetails>>> getUser({String? token}) async {
    try {
      final response = await softTechTestApi.getUser();
      return Result.success(objectMapper.toGetUser(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }

    // TODO: implement getUser
  }

  @override
  Future<Result<BaseResponseDto<AppointmentDetailsDto>>>
      getAppointmentDetails() async {
    try {
      final response = await softTechTestApi.getAppointmentDetails();
      return Result.success(objectMapper.toGetAppointmentDetails(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> updateUser(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? alternateNumber,
      File? avatar,
      String? country,
      String? state,
      String? city,
      String? zipCode,
      String? address,
      String? dob,
      String? gender,
      String? ssn,
      String? prefferdLocation,
      File? insuranceCardFront,
      File? insuranceCardBack,
      String? insuranceName,
      String? insurancePolicyNumber,
      String? paymentType}) async {
    try {
      final response = await softTechTestApi.updateUser(
          firstName: firstName!,
          lastName: lastName!,
          email: email!,
          phone: phone!,
          address: address,
          alternatePhone: alternateNumber,
          avatar: avatar,
          city: city,
          country: country,
          dob: dob,
          gender: gender,
          prefferdLocation: prefferdLocation,
          ssn: ssn,
          state: state,
          zipCode: zipCode,
          insuranceCardFrontImage: insuranceCardFront,
          insuranceCardBackImage: insuranceCardBack,
          insuranceName: insuranceName,
          insurancePoilcyNumber: insurancePolicyNumber,
          paymentType: paymentType!);
      return Result.success(objectMapper.toUpdateUser(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> bookAppointment(
      {required String appointmenDate,
      required String method,
      required String paymentType,
      required String requestType,
      required String serviceName,
      required String timeSlot,
      required String technologyType,
      required int price}) async {
    try {
      final response = await softTechTestApi.bookAppointment(
          appointmenDate: appointmenDate,
          method: method,
          paymentType: paymentType,
          requestType: requestType,
          serviceName: serviceName,
          timeSlot: timeSlot,
          technologyType: technologyType,
          price: price);
      return Result.success(objectMapper.toBookAppointment(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }
}
