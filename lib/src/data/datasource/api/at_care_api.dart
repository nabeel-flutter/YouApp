// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/data/dto/appointments_history_dto.dart';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/data/dto/dashboard_overview_dto.dart';
import 'package:new_beginnings/src/data/dto/data_list_dto.dart';
import 'package:new_beginnings/src/data/dto/doctor_dto.dart';
import 'package:new_beginnings/src/data/dto/medical_records_history_dto.dart';
import 'package:new_beginnings/src/data/dto/pay_bills_dto.dart';
import 'package:new_beginnings/src/data/dto/product_dto.dart';
import 'package:new_beginnings/src/data/dto/sehat_scan_history_dto.dart';
import 'package:new_beginnings/src/data/dto/token_dto.dart';

import 'package:new_beginnings/src/pages/doctors/models/team_dto.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';

import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';

///
///
class SoftTechTestApi {
  static const String kRouteDashboardOverview = 'dashboard';
  static const String kRouteSehatScanHistory = 'health-scan';
  static const String kRoutePastAppointments = 'appointment';
  static const String kRouteMedicalRecords = 'medical-record';
  static const String kRouteAddMedicalRecords = 'medical-record';
  static const String kRouteDoctors = 'doctor/listing';
  static const String kRouteShareMedicalRecord = 'medical-record/share';

  static const String kRouteMedicalRecordsDownloadRecord =
      'medical-record/download-medical-record-pdf';

  static String kRouteGetProducts = 'products';

  static String kRouteAuthLogin = 'login';

  static String kRouteAuthSignUp = 'register';
  static String kRoutePayBills = 'billing';

  static String kRouteAuthForgetPassword = 'password/forgot';

  static String kRouteAuthVerifyEmail = 'resendEmailVerify';
  static String kRouteUserDetail = 'user';
  static String kRouteLogs = 'logs';
  static String kRouteUpdateUserDetail = 'user/edit';
  static String kRouteGetAppointmentDetails = 'check_appointment_condition';

  static String kRouteCreateAppointment = 'appointment';

  static String kRoutegetTeam = 'doctors';

  static String kRouteGetProductDetail(int id) => '$kRouteGetProducts/$id';

  static String kRouteDeleteMedicalRecord(int id) =>
      '$kRouteMedicalRecords/$id';
  static String kRouteDeleteMedicalRecordFile(int id) =>
      '$kRouteMedicalRecords/file/$id';
  static String kRouteDownloadRecord(int id) =>
      '$kRouteMedicalRecordsDownloadRecord/$id';

  final Dio dio;

  const SoftTechTestApi(this.dio);

  ///
  ///  customer Dashboard Overview
  ///
  Future<BaseResponseDto<DashBoardOverViewDto>> getDashBoardOverview() async {
    final response = await dio.get(kRouteDashboardOverview);
    return BaseResponseDto<DashBoardOverViewDto>.fromJson(
      response.data,
      (value) => DashBoardOverViewDto.fromJson(value as Map<String, dynamic>),
    );
  }

  ///
  ///  get sehatScan history
  ///
  Future<BaseResponseDto<SehatScanHistoryDto>> getSehatScanHistory(date) async {
    final response = await dio.get(kRouteSehatScanHistory, queryParameters: {
      'date': date,
    });
    return BaseResponseDto<SehatScanHistoryDto>.fromJson(
      response.data,
      (value) => SehatScanHistoryDto.fromJson(value as Map<String, dynamic>),
    );
  }

  ///
  ///  get past appointment history
  ///
  Future<BaseResponseDto<AppointmentsHistoryDto>> getPastAppointments(
      {required String endDate, required String startDate}) async {
    final response = await dio.get(
      kRoutePastAppointments,
      queryParameters: {'status': 'all'},
    );
    return BaseResponseDto<AppointmentsHistoryDto>.fromJson(
      response.data,
      (value) => AppointmentsHistoryDto.fromJson(value as Map<String, dynamic>),
    );
  }

  ///
  ///  get medical records history
  ///
  Future<BaseResponseDto<MedicalRecordsHistoryDto>>
      getMedicalRecordsHistory() async {
    final response = await dio.get(
      kRouteMedicalRecords,
    );
    return BaseResponseDto<MedicalRecordsHistoryDto>.fromJson(
      response.data,
      (value) =>
          MedicalRecordsHistoryDto.fromJson(value as Map<String, dynamic>),
    );
  }

  Future<BaseResponseDto<MedicalRecordsHistoryDto>> getMedicalRecordsHistoryB(
      String startFrom, String endedTo) async {
    // log("hehehe + $kRouteMedicalRecords/search-medical-record?start_from=$startFrom&ended_to=$endedTo");

    final response = await dio.get(
      "$kRouteMedicalRecords?start_date=$startFrom&end_date=$endedTo",

      // "$kRouteMedicalRecords/search-medical-record?start_from=$startFrom&ended_to=$endedTo",
    );

    return BaseResponseDto<MedicalRecordsHistoryDto>.fromJson(
      response.data,
      (value) =>
          MedicalRecordsHistoryDto.fromJson(value as Map<String, dynamic>),
    );
  }

  ///
  ///  get medical records history
  ///
  Future<void> addMedicalRecords(
    List<File> filesList,
    List<int> ids,
    String date,
    String fileName,
    bool isInstantConsultationScreen,
  ) async {
    List<MultipartFile> files = [];

    for (var i = 0; i < filesList.length; i++) {
      files.add(
        await MultipartFile.fromFile(
          filesList[i].path,
          filename: filesList[i].path,
          contentType: MediaType('image', filesList[i].path),
        ),
      );
    }

    final formData = FormData.fromMap({
      isInstantConsultationScreen == false ? 'file_name' : 'filename': fileName,
      'date': date,
      'file_type_id[]': ids,
      'file[]': files,
    });
    await dio.post(
      isInstantConsultationScreen
          ? 'instant-medical-record'
          : kRouteAddMedicalRecords,
      data: formData,
    );
    return;
  }

  Future<void> editMedicalRecords(
    List<File> filesList,
    List<int> ids,
    String date,
    String fileName,
    String? medicalRecordId,
    bool isInstantConsultationScreen,
  ) async {
    List<MultipartFile> files = [];

    for (var i = 0; i < filesList.length; i++) {
      files.add(
        await MultipartFile.fromFile(
          filesList[i].path,
          filename: filesList[i].path,
          contentType: MediaType('image', filesList[i].path),
        ),
      );
    }

    final formData = FormData.fromMap({
      isInstantConsultationScreen == false ? 'file_name' : 'filename': fileName,
      'date': date,
      'file_type_id[]': ids.toList(),
      'file[]': files,
      isInstantConsultationScreen == false
          ? 'medical_record'
          : 'instant_medical_record': medicalRecordId
    });
    await dio.post(
      isInstantConsultationScreen
          ? 'instant-medical-record/update'
          : '$kRouteAddMedicalRecords/update',
      data: formData,
    );
    return;
  }

  ///
  ///  get doctors data
  ///
  Future<DataListDto<DoctorDto>> getDoctors(
      {required int medicalRecordId}) async {
    final response = await dio.get(kRouteDoctors, queryParameters: {
      'is_appointment': true,
      'medical_record_id': medicalRecordId
    });
    return DataListDto<DoctorDto>.fromJson(
      response.data,
      (value) => DoctorDto.fromJson(value as Map<String, dynamic>),
    );
  }

  ///
  ///  share medical records with doctor
  ///
  Future<void> shareMedicalRecord(
    int doctorId,
    int medicalRecordId, {
    required bool isFromInstantConsultation,
  }) async {
    await dio.post(
      isFromInstantConsultation
          ? 'instant-medical-record/share'
          : kRouteShareMedicalRecord,
      data: {
        isFromInstantConsultation
            ? 'instant_medical_record_id'
            : 'medical_record_id': medicalRecordId,
        'doctor_id': doctorId,
      },
    );
    return;
  }

  ///
  ///  delete medical records
  ///
  Future<void> deleteMedicalRecord(
    int medicalRecordId,
  ) async {
    await dio.delete(
      kRouteDeleteMedicalRecord(medicalRecordId),
    );
    return;
  }

  ///
  ///  delete medical record file
  ///
  Future<void> deleteMedicalRecordFile(
    int fileId,
  ) async {
    await dio.delete(
      kRouteDeleteMedicalRecordFile(fileId),
    );
    return;
  }

  ///
  ///  delete medical records
  ///
  Future<void> downloadMedicalRecord(
    int medicalRecordId,
  ) async {
    await dio.get(
      kRouteDownloadRecord(medicalRecordId),
    );
    return;
  }

  Future<BaseResponseDto<TokenDto>> signIn(
      {required String email, required String password}) async {
    final response = await dio
        .post(kRouteAuthLogin, data: {'email': email, 'password': password});
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => TokenDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<ProductDto>> getProductDetails(int id) async {
    final response = await dio.get(kRouteGetProductDetail(id));
    return BaseResponseDto.fromJson({'data': response.data},
        (value) => ProductDto.fromJson(value as Map<String, dynamic>));
  }

  Future<DataListDto<ProductDto>> getProducts(int limit) async {
    final response =
        await dio.get(kRouteGetProducts, queryParameters: {'limit': limit});
    return DataListDto.fromJson(
      {'data': response.data},
      (value) => ProductDto.fromJson(
        value as Map<String, dynamic>,
      ),
    );
  }

  Future<BaseResponseDto<TokenDto>> signUp({
    required String password,
    required firstName,
    required String lastName,
    required String email,
    required String phone,
    required String confirmPassword,
  }) async {
    final response = await dio.post(kRouteAuthSignUp, data: {
      'firstName': firstName,
      'password': password,
      'lastName': lastName,
      'phone': phone,
      'email': email
    });
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => TokenDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<PayBillsDto>> payBill(
      {required String name,
      required String email,
      required String phone,
      required String paymentType,
      required String message,
      required int price}) async {
    final response = await dio.post(kRoutePayBills, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'paymentType': paymentType,
      'message': message,
      'price': price,
    });
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => PayBillsDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto> forgetPassword({
    required String email,
  }) async {
    final response =
        await dio.post(kRouteAuthForgetPassword, data: {'email': email});
    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }

  Future<BaseResponseDto> verifyEmail({required String email}) async {
    final response =
        await dio.post(kRouteAuthVerifyEmail, data: {'email': email});
    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }

  Future<BaseResponseDto<UserDetails>> getUser() async {
    final response = await dio.get(kRouteUserDetail);
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => UserDetails.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<LogDetails>> getLogs() async {
    final response = await dio.get(kRouteLogs);
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => LogDetails.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<TeamDto>> getTeam() async {
    final response = await dio.get(kRoutegetTeam);

    return BaseResponseDto.fromJson({"data": response.data},
        (value) => TeamDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<AppointmentDetailsDto>> getAppointmentDetails() async {
    final response = await dio.get(kRouteGetAppointmentDetails);
    return BaseResponseDto.fromJson(
        {"data": response.data},
        (value) =>
            AppointmentDetailsDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto> updateUser({
    String? firstName,
    String? lastName,
    String? phone,
    String? alternatePhone,
    String? email,
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
    File? insuranceCardFrontImage,
    File? insuranceCardBackImage,
    String? insuranceName,
    String? insurancePoilcyNumber,
    required String paymentType,
  }) async {
    MultipartFile? insuranceCardFrontImage0 = insuranceCardFrontImage != null
        ? await MultipartFile.fromFile(insuranceCardFrontImage.absolute.path,
            filename: insuranceCardFrontImage.absolute.path.split('/').last,
            contentType: MediaType(
                'image', insuranceCardFrontImage.absolute.path.split('.').last))
        : null;
    MultipartFile? insuranceCardBackImage0 = insuranceCardBackImage != null
        ? await MultipartFile.fromFile(insuranceCardBackImage.absolute.path,
            filename: insuranceCardBackImage.absolute.path.split('/').last,
            contentType: MediaType(
                'image', insuranceCardBackImage.absolute.path.split('.').last))
        : null;
    MultipartFile? avatar0 = avatar != null
        ? await MultipartFile.fromFile(avatar.absolute.path,
            filename: avatar.absolute.path.split('/').last,
            contentType:
                MediaType('image', avatar.absolute.path.split('.').last))
        : null;
    final formData = FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'alternatePhone': alternatePhone,
      'email': email,
      'avatar': avatar0,
      'country': country,
      'state': state,
      'city': city,
      'zip': zipCode,
      'address': address,
      'birthDate': dob,
      'gender': gender,
      'ssn': ssn,
      'suffix': suffix,
      'preferredLocation': prefferdLocation,
      'paymentType': paymentType,
      "frontPic": insuranceCardFrontImage0,
      "backPic": insuranceCardBackImage0,
      'insuranceName': paymentType == "insured" ? insuranceName : null,
      'insurancePolicy': paymentType == "insured" ? insurancePoilcyNumber : null
    });
    final response = await dio.put(
      kRouteUpdateUserDetail,
      data: formData,
    );

    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }

  Future<BaseResponseDto> bookAppointment(
      {required String appointmenDate,
      required String method,
      required String paymentType,
      required String requestType,
      required String serviceName,
      required String timeSlot,
      required String technologyType,
      required bool initialPayment,
      required int price}) async {
    final response = await dio.post(kRouteCreateAppointment, data: {
      'appointmentDate': appointmenDate,
      'method': method,
      'paymentType': paymentType,
      'request': requestType,
      'serviceName': serviceName,
      'timeSlot': timeSlot,
      'type': technologyType,
      'price': price,
      'initialPayment': initialPayment
    });
    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }
}
