import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/domain/common/result.dart';
import 'package:your_app_test/src/pages/my_logs/model/my_logs_model.dart';

part 'logs_state.dart';
part 'logs_cubit.freezed.dart';

class LogsCubit extends Cubit<LogsState> {
  ApiRepository apiRepository;
  LogsCubit(this.apiRepository) : super(const LogsState.initial());
  Future<void> getLogsData() async {
    emit(const _Loading());
    final Result<BaseResponseDto<LogDetails>> result =
        await apiRepository.getLogs();
    result.when(
        success: (data) {
          emit(_Loaded(data.data!));
        },
        failed: (error) => emit(_Error(error.message)));
  }
}
