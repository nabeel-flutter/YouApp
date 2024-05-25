import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/constant/assets_constants.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/flavors/flavour_banner.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return flavorBanner(
        show: true,
        child: MainScaffold(
            isGradient: false,
            appBar: const AppBarWidget(
              title: '@johndoe',
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              AssetsConstants.profileImage,
                            )),
                        color: const Color(
                          0xff162329,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '@johndoe, 28',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.936,
                                letterSpacing: -0.23),
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                height: 1.573,
                                letterSpacing: -0.23),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 97,
                                height: 36,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(100)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
        // BlocProvider(
        //     create: (context) => getIt.get<AnimatedDrawerCubit>()
        //       ..getDashBoardOverview(context,
        //           pageController: PageController(initialPage: 0),
        //           advancedDrawerController: AdvancedDrawerController()),
        //     child: BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
        //       builder: (context, state) => state.maybeWhen(
        //         loaded: (
        //           pageControllerLoaded,
        //         ) =>
        //             AnimatedDrawerAfterLoadedState(
        //           color: getThemeColor(context),
        //         ),
        //         animatedDrawerIndexUpdated: (
        //           index,
        //           isOpen,
        //         ) {
        //           return AnimatedDrawerAfterLoadedState(
        //               color: getThemeColor(context));
        //         },
        //         error: (error) => RetryButton(
        //           onTap: () => context
        //               .read<AnimatedDrawerCubit>()
        //               .getDashBoardOverview(context,
        //                   pageController: PageController(initialPage: 0),
        //                   advancedDrawerController: AdvancedDrawerController()),
        //         ),
        //         loading: () => const AppProgressIndicator(),
        //         orElse: () => const SizedBox.shrink(),
        //       ),
        //     )),

        );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              context.router.pushNamed(RouteConstants.settingRoute);
            },
            icon: const Icon(
              Icons.more_horiz,
              color: ColorConstants.white,
              size: 30,
            ))
      ],
    );
  }
}
