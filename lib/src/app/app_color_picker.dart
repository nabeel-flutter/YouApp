import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/cubit/is_gradient_background_cubit.dart';
import 'package:your_app_test/src/theme/get_theme_color.dart';
import 'package:your_app_test/src/theme/switch_color_app.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        18,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.selectColor,
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialColorPicker(
            onColorChange: (color) async {
              switchColorApp(color: color);
              BlocProvider.of<IsGradientBackgroundCubit>(context)
                  .updateState(color: color);
            },
            onMainColorChange: (ColorSwatch? color) async {
              switchColorApp(color: color!);
              BlocProvider.of<IsGradientBackgroundCubit>(context)
                  .updateState(color: color);
            },
            selectedColor: getThemeColor(context),
          ),
        ],
      ),
    );
  }
}
