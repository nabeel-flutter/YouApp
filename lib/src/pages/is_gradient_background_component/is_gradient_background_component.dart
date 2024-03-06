import 'package:new_beginnings/src/app/app_export.dart';

class PrimaryBackground extends StatelessWidget {
  const PrimaryBackground({
    super.key,
    required this.body,
    this.isBackAppBar,
    this.appbarText,
    this.isAppBar = true,
    this.floatingActionButton,
    this.isProfileAppbar,
  });
  final Widget body;
  final bool? isBackAppBar;
  final String? appbarText;
  final bool? isAppBar;
  final Widget? floatingActionButton;
  final bool? isProfileAppbar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<IsGradientBackgroundCubit>()
          ..updateState(color: getThemeColor(context)),
        child:
            BlocBuilder<IsGradientBackgroundCubit, IsGradientBackgroundState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            updateStateDarkLight: (value) => Container(
              decoration:
                  value ? BoxDecoration(gradient: linerGradientForApp()) : null,
              child: MainScaffold(
                floatingActionButton: floatingActionButton,
                body: body,
                isGradient: true,
                appBar: isAppBar != null
                    ? isAppBar!
                        ? AppBarcomponent(
                            isTitleTowLines: false,
                            isBackAppBar: isBackAppBar ?? false,
                            isGradient: true,
                            title: appbarText ?? '',
                            isProfileBackAppbar: isProfileAppbar ?? false,
                          )
                        : null
                    : null,
              ),
            ),
            updateColorState: (color) => Container(
              decoration: BoxDecoration(
                  gradient: linerGradientForApp(
                color: color,
              )),
              child: MainScaffold(
                body: body,
                isGradient: true,
                appBar: isAppBar != null
                    ? isAppBar!
                        ? AppBarcomponent(
                            isTitleTowLines: false,
                            isBackAppBar: isBackAppBar ?? false,
                            isGradient: true,
                            title: appbarText ?? '',
                            isProfileBackAppbar: true,
                          )
                        : null
                    : null,
              ),
            ),
          ),
        ));
  }
}
