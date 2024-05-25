import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/cubit/is_gradient_background_cubit.dart';
import 'package:your_app_test/src/theme/get_theme_color.dart';
import 'package:your_app_test/src/theme/lighten_darken_color.dart';
import 'package:your_app_test/src/theme/theme_switch.dart';

class AppTileComponent extends StatelessWidget {
  final String test;
  final String image;
  final VoidCallback onTap;
  final bool isExpandable;

  const AppTileComponent({
    super.key,
    required this.test,
    required this.image,
    required this.onTap,
    required this.isExpandable,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsGradientBackgroundCubit, IsGradientBackgroundState>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: !isExpandable
                        ? const EdgeInsets.symmetric(vertical: 10)
                        : EdgeInsets.zero,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: darken(lighten(getThemeColor(context), 0.2), 0.1),
                    ),
                    child: Row(
                      children: [
                        TilesIconComponent(image: image),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(test),
                      ],
                    ),
                  ),
                ),
            updateColorState: (color) => GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: !isExpandable
                        ? const EdgeInsets.symmetric(vertical: 10)
                        : EdgeInsets.zero,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: darken(lighten(color, 0.2), 0.1),
                    ),
                    child: Row(
                      children: [
                        TilesIconComponent(image: image),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(test),
                      ],
                    ),
                  ),
                )));
  }
}
