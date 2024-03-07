import 'package:new_beginnings/src/app/app_export.dart';

class UserProfileComponent extends StatelessWidget {
  const UserProfileComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 5, color: Color(0xff80BCBD))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    fit: BoxFit.fill,
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorConstants.greenish,
                    border: Border.all(
                        width: 4, color: darken(getThemeColor(context), 0.2))),
                child: const Icon(
                  Icons.camera_alt,
                  color: ColorConstants.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nabeel Khanjee',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'nabeelshakeel966@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(0xff0A7E80)),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class UserProfileBottomComponent extends StatelessWidget {
  const UserProfileBottomComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0A7E80), Color(0xff023E3F)])),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.greenish,
                ),
                onPressed: () {
                  context.router.push(EditProfileRoute());
                },
                child: const Text('Edit Profile')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD80404),
                ),
                onPressed: () {
                  getIt
                      .get<SharedPreferencesUtil>()
                      .removeValue(SharedPreferenceConstants.apiAuthToken)
                      .then((value) async => await context.router
                          .pushAndPopUntil(
                              predicate: (route) => false,
                              const SignInRoute()));
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
