import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/pay_bills_dto.dart';
import 'package:your_app_test/src/domain/common/result.dart';

part 'my_bills_state.dart';
part 'my_bills_cubit.freezed.dart';

class MyBillsCubit extends Cubit<MyBillsState> {
  ApiRepository apiRepository;
  MyBillsCubit(this.apiRepository) : super(const MyBillsState.initial());
  Future<void> payBill(
      {required String name,
      required String email,
      required String phone,
      required String paymentType,
      required String message,
      required int price}) async {
    emit(const _Loading());

    final Result<BaseResponseDto<PayBillsDto>> result =
        await apiRepository.payBill(
            name: name,
            email: email,
            phone: phone,
            paymentType: paymentType,
            message: message,
            price: price);
    result.when(
      success: (data) {
        emit(_Loaded(data.data!));
      },
      failed: (error) {
        emit(_Error(error.message));
      },
    );
    return;
  }
}
