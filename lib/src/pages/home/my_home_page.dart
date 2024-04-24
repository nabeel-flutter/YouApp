import 'package:your_app_test/src/app/app_export.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return flavorBanner(
      show: true,
      child: BlocProvider(
          create: (context) => getIt.get<AnimatedDrawerCubit>()
            ..getDashBoardOverview(context,
                pageController: PageController(initialPage: 0),
                advancedDrawerController: AdvancedDrawerController()),
          child: BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
            builder: (context, state) => state.maybeWhen(
              loaded: (
                pageControllerLoaded,
              ) =>
                  AnimatedDrawerAfterLoadedState(
                color: getThemeColor(context),
              ),
              animatedDrawerIndexUpdated: (
                index,
                isOpen,
              ) {
                return AnimatedDrawerAfterLoadedState(
                    color: getThemeColor(context));
              },
              error: (error) => RetryButton(
                onTap: () => context
                    .read<AnimatedDrawerCubit>()
                    .getDashBoardOverview(context,
                        pageController: PageController(initialPage: 0),
                        advancedDrawerController: AdvancedDrawerController()),
              ),
              loading: () => const AppProgressIndicator(),
              orElse: () => const SizedBox.shrink(),
            ),
          )),
    );
  }
}
