import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/models/services_model.dart';

part 'service_state.dart';
part 'service_cubit.freezed.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(const ServiceState.initial());
  List<ServiceModel> services = [
    ServiceModel(
        name: "Psychiatric\nEvaluation",
        image: AssetsConstants.pscyEvImage,
        description:
            "Psychiatric evaluation is a comprehensive assessment of a patient's mental and physical health"),
    ServiceModel(
        name: "Group Therapy",
        image: AssetsConstants.pscyEvImage,
        description:
            "Group therapy is a form of psychotherapy that involves one or more therapists working"),
    ServiceModel(
        name: "Medication\nManagement",
        image: AssetsConstants.pscyEvImage,
        description:
            "Medication management is a strategy for engaging with patients and caregivers to create a complete and accurate medication list"),
  ];

  void getServices() {
    emit(ServiceState.loaded(services));
  }
}
