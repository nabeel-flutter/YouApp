import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/pages/profile/cubit/about_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/update_profile_cubit.dart';
import 'package:your_app_test/src/components/liner_gradient_text.dart';

class AboutEditTitle extends StatelessWidget {
  const AboutEditTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('About',
          style: TextStyle(
              height: 1.694,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (profile) {
              BlocProvider.of<AboutCubit>(context).swichState();
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return RichText(
            text: TextSpan(
              text: 'Save & Update',
              style: TextStyle(
                height: 1.5,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                foreground: Paint()
                  ..shader = linearGradientText(colors: [
                    Color(0xff94783E),
                    Color(0xffF3EDA6),
                    Color(0xffF8FAE5),
                    Color(0xffFFE2BE),
                    Color(0xffD5BE88),
                    Color(0xffF8FAE5),
                    Color(0xffD5BE88),
                  ]),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => BlocProvider.of<UpdateProfileCubit>(context)
                    .updateProfileCubit(),
            ),
          );
        },
      ),
    ]);
  }
}
