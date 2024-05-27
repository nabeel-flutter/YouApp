import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_app_test/src/components/retry_button.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/flavors/flavour_banner.dart';
import 'package:your_app_test/src/pages/profile/components/user_profie_state.dart';
import 'package:your_app_test/src/pages/profile/cubit/about_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProfileCubit>(context).getProfile();
    BlocProvider.of<AboutCubit>(context).isEdit = true;
    BlocProvider.of<AboutCubit>(context).swichState();
    return flavorBanner(
        show: true,
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                loaded: (profile) => profile.birthday != null
                    ? profile.getAge(DateTime.now(),
                        DateTime(int.parse(profile.birthday!.split('/').last)))
                    : null),
            builder: (context, state) => state.maybeWhen(
                orElse: () => Container(),
                loading: () => Skeletonizer(
                    child: UserProfileState(
                        profile: GetProfileDto(
                            username: 'john',
                            name: 'john',
                            interests: ['john']))),
                loaded: (profile) => UserProfileState(profile: profile),
                error: (massange) => RetryState(
                    onTap: () =>
                        context.read<GetProfileCubit>().getProfile()))));
  }
}

