import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserProfileCubit>(context).getUserData();
    return BlocConsumer<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            error: (message) => ErrorState(
                  message: message,
                  onTap: () {
                    context.read<UserProfileCubit>().getUserData();
                  },
                ),
            loading: () => const Skeletonizer(child: ProfileScreenBody()),
            loaded: (user) => ProfileScreenBody(user: user)));
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.message,
    required this.onTap,
  });
  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Something Wrong",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(message),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: onTap, child: const Text("Retry"))
        ],
      )),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    this.user,
  });
  final UserDetails? user;
  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
        isAppBar: false,
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: BottomConcaveClipper(),
                  child: Container(
                      height: 250,
                      width: double.infinity,
                      color: const Color(0xff0A7E80),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 70),
                          child: const Text(
                            "Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 7,
                left: 0,
                right: 0,
                child: UserProfileComponent(
                  image: user != null
                      ?user!.data!.avatar!.isNotEmpty?user!.data!.avatar:null
                      : null,
                  userName: user != null
                      ? '${user!.data!.firstName} ${user!.data!.lastName}'
                      : 'User Email',
                  userEmail:
                      user != null ? '${user!.data!.email}' : "User Name",
                  profile: true,
                )),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(),
              UserProfileBottomComponent(
                onPressed: () {
                  context.router.push(const EditProfileRoute());
                },
              )
            ]),
          ],
        ),
        isBackAppBar: false,
        appbarText: StringConstants.profile);
  }
}

class BottomConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(size.width * 0.25, size.height);
    var controlPoint2 = Offset(size.width * 0.75, size.height);
    var endPoint = Offset(size.width, size.height * 0.5);

    Path path = Path()
      ..lineTo(0, size.height * 0.5) //bottom left corner se start krenge
      ..cubicTo(
        // bottom wala curve yaha se shuru he
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
