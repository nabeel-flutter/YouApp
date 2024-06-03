import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/components/main_scaffold.dart';
import 'package:e_finder/src/components/app_bar_component.dart';
import 'package:e_finder/src/pages/profile/components/chip_text_field.dart';
import 'package:e_finder/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:e_finder/src/pages/profile/cubit/update_profile_cubit.dart';
import 'package:e_finder/src/components/liner_gradient_text.dart';

@RoutePage()
class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        isGradient: true,
        appBar: AppBarWidget(
          actions: [
            Container(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Save',
                      style: TextStyle(
                        // height: 1.5,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..shader = linearGradientText(colors: [
                            Color(0xffABFFFD),
                            Color(0xff4599DB),
                            Color(0xffAADAFF),
                          ]),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          BlocProvider.of<UpdateProfileCubit>(context)
                              .updateProfileCubit();
                        },
                    ),
                  ),
                ],
              ),
            )
          ],
          isBack: true,
        ),
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                loaded: (profile) => BlocProvider.of<GetProfileCubit>(context)
                    .getProfile()
                    .then((value) => context.router.maybePop())),
            builder: (context, state) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Tell everyone about yourself',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  foreground: Paint()
                                    ..shader = linearGradientText(colors: [
                                      Color(0xff94783E),
                                      Color(0xffF3EDA6),
                                      Color(0xffF8FAE5),
                                      Color(0xffFFE2BE),
                                      Color(0xffD5BE88),
                                      Color(0xffF8FAE5),
                                      Color(0xffD5BE88)
                                    ])),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {})),
                      SizedBox(height: 12),
                      Text('What interest you?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                      SizedBox(height: 35),
                      ChipTextField()
                    ]))));
  }
}
