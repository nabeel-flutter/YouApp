import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:new_beginnings/src/pages/my_logs/cubit/mylogs_state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit() : super(DataInitial());

  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjAxZjUxNmFkMWE3NTU0ZTc0Y2Q1MiIsImlhdCI6MTcxMjEyMjk3NCwiZXhwIjoxNzEyMjk1Nzc0fQ.R_Xdym0vikgKBVipGrQ9BOm0KIqLx180XFPETM5frD4';

  Future<void> fetchData() async {
    try {
      emit(DataLoading());

      final response = await http.get(
        Uri.parse(
            'http://ec2-54-164-108-167.compute-1.amazonaws.com:7000/api/v1/logs'),
        headers: {
          'token': token,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(DataLoaded(data));
      } else {
        emit(DataError(
            "Failed to fetch data with status code: ${response.statusCode}."));
      }
    } catch (e) {
      emit(DataError("An error occurred: $e"));
    }
  }
}
