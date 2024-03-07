import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/models/services_model.dart';

import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class ServiceInnerScreen extends StatelessWidget {
  final ServiceModel service;
  const ServiceInnerScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SingleChildScrollView(
          child: ServiceTopWidget(
            image: service.image!,
            title: "What is a comprehensive psychiatric evaluation?",
            heading:
                "The Importance of Comprehensive Psychiatric Evaluation in Group Therapy",
            description: service.description!,
          ),
        ),
      ),
      isBackAppBar: true,
      appbarText: service.name,
    );
  }
}
