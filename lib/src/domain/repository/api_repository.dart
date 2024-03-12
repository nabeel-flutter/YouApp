import 'dart:io';
import 'package:new_beginnings/src/data/dto/base_response_dto.dart';
import 'package:new_beginnings/src/data/dto/data_list_dto.dart';
import 'package:new_beginnings/src/data/dto/product_dto.dart';
import 'package:new_beginnings/src/data/dto/token_dto.dart';
import 'package:new_beginnings/src/domain/domain.dart';
import 'package:new_beginnings/src/domain/model/appointment.dart';
import 'package:new_beginnings/src/domain/model/data_list.dart';
import 'package:new_beginnings/src/domain/model/docotor.dart';
import 'package:new_beginnings/src/domain/model/medical_records.dart';
import 'package:new_beginnings/src/pages/profile/model/userdata_model.dart';

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
  Future<Result<DataList<Doctor>>> getDoctors({required int medicalRecordId});

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

  Future<Result<BaseResponseDto<TokenDto>>> signIn(
      {required String email, required String password});

  Future<Result<BaseResponseDto<TokenDto>>> signUp(
      {required String lastName,
      required String phone,
      required String firstName,
      required String email,
      required String confirmPassword,
      required String password});

  Future<Result<BaseResponseDto>>  forgetPassword({required String email});

  Future<Result<BaseResponseDto>> verifyEmail({required String email});

 Future<Result<BaseResponseDto<UserDetails>>>  getUser() ;

}
