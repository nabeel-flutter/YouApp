import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/cubit/cubit/service_cubit.dart';

@RoutePage()
class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) {
          await BlocProvider.of<ServiceCubit>(context)
              .close()
              .then((value) => context.router.pop());
        }
      },
      child: PrimaryBackground(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              //search services
              const SearchBarWidget(),
              const SizedBox(height: 20),
              BlocProvider<ServiceCubit>(
                create: (context) =>
                    BlocProvider.of<ServiceCubit>(context)..getServices(),
                lazy: true,
                child: BlocBuilder<ServiceCubit, ServiceState>(
                  builder: (context, state) => state.maybeWhen(
                      orElse: () => Container(),
                      loaded: (services) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (services[index].name ==
                                      "Psychiatric\nEvaluation") {
                                    context.router.push(
                                      ServiceInnerRoute(
                                          service: services[index]),
                                    );
                                  }
                                  if (services[index].name == "Group Therapy") {
                                    debugPrint("Group Therapy");
                                    context.router.push(
                                      const GTRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Medication\nManagement") {
                                    context.router.push(
                                      const MMRoute(),
                                    );
                                  }
                                  if (services[index].name == "Play Therapy") {
                                    context.router.push(
                                      const PTRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Individual Therapy") {
                                    context.router.push(
                                      const IDRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Couple & Family Therapy") {
                                    context.router.push(
                                      const CPTRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Pharmacogenomics") {
                                    context.router.push(
                                      const PMRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Addiction Treatment") {
                                    context.router.push(
                                      const ATRoute(),
                                    );
                                  }
                                  if (services[index].name ==
                                      "Telepsychiatry") {
                                    context.router.push(
                                      const TPRoute(),
                                    );
                                  }
                                  if (services[index].name == "Primary Care") {
                                    context.router.push(
                                      const PCRoute(),
                                    );
                                  }
                                },
                                child: ServiceCard(
                                  title: services[index].name,
                                  image: services[index].image,
                                  description: services[index].description,
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        appbarText: StringConstants.services,
        isBackAppBar: true,
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstants.widgetBgColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: ColorConstants.primaryColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                onChanged: (value) => BlocProvider.of<ServiceCubit>(context)
                  ..searchService(value),
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.filter_alt_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  hintText: "Find Best Services",
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.widgetBgColor,
                        fontSize: 14,
                        height: 2,
                      ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String? image;
  final String title;
  final String? description;
  const ServiceCard(
      {super.key, this.image, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstants.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 19,
              offset: const Offset(4, 8),
            ),
          ],
          color: ColorConstants.white.withOpacity(0.65),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image!,
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10), // Add spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.primaryTextColor,
                                fontSize: 16,
                              ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.primaryTextColor,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
