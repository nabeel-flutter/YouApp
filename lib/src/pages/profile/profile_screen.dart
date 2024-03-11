import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                      color: Color(0xff0A7E80),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 70),
                          child: Text(
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
                  profile: true,
                )),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Spacer(), const UserProfileBottomComponent()]),
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
