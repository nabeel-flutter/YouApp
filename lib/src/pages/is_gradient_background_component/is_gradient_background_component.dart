import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/appbar_component.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/cubit/is_gradient_background_cubit.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/liner_gradient_for_app.dart';
import 'package:your_app_test/src/theme/get_theme_color.dart';

class PrimaryBackground extends StatelessWidget {
  const PrimaryBackground({
    super.key,
    required this.body,
    this.isBackAppBar,
    this.appbarText,
    this.isAppBar = true,
    this.floatingActionButton,
  });
  final Widget body;
  final bool? isBackAppBar;
  final String? appbarText;
  final bool? isAppBar;
  final Widget? floatingActionButton;

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
                          )
                        : null
                    : null,
              ),
            ),
          ),
        ));
  }
}
