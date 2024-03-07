import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/models/services_model.dart';

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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  service.image!,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              ServiceTitleWidget(service: service),
              const SizedBox(height: 20),
              Text(
                "The Importance of Comprehensive Psychiatric Evaluation in Group Therapy",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 20),
              Text(service.description!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ))
            ],
          ),
        ),
      ),
      isBackAppBar: true,
      appbarText: service.name,
    );
  }
}

class ServiceTitleWidget extends StatelessWidget {
  const ServiceTitleWidget({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "What is comprehensive ${service.name} ?",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const Divider(
          color: ColorConstants.yellowGolden,
          thickness: 3,
        ),
      ],
    );
  }
}
