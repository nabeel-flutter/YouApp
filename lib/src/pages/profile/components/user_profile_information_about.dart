import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/data/dto/get_profile_dto.dart';
import 'package:e_finder/src/pages/profile/components/about_editable_state.dart';
import 'package:e_finder/src/pages/profile/components/about_view_state.dart';
import 'package:e_finder/src/pages/profile/cubit/about_cubit.dart';
import 'package:e_finder/src/pages/profile/cubit/get_profile_cubit.dart';

class UserProfileInforamtionAbout extends StatelessWidget {
  const UserProfileInforamtionAbout({
    super.key,
    required this.profile,
  });

  final GetProfileDto profile;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutCubit, AboutState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        view: () => BlocProvider.of<GetProfileCubit>(context).getProfile(),
      ),
      builder: (context, state) {
        return state.maybeWhen(
          editable: () {
            return AboutEditableState(profile: profile);
          },
          orElse: () => AboutViewState(profile: profile),
        );
      },
    );
  }
}
