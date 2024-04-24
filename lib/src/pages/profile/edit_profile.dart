import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/editscreen_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserProfileCubit>(context).getUserData();

    return BlocConsumer<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeWhen(
            orElse: () => Container(),
            loaded: (user) {},
          );
        },
        builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            error: (message) => Material(
              child: ErrorState(
                    message: message,
                    onTap: () {
                      context.read<UserProfileCubit>().getUserData();
                    },
                  ),
            ),
            loading: () => const Skeletonizer(child: EditScreenBody()),
            loaded: (user) => EditScreenBody(
                  userDetails: user,
                )));
  }
}
