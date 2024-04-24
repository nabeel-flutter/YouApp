import 'package:your_app_test/src/app/app_export.dart';

class EditScreenTopComponent extends StatelessWidget {
  const EditScreenTopComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Ensure space is distributed evenly on both ends of the Row.
                    children: [
                      GestureDetector(
                        onTap: () => NavigationUtil.pop(context),
                        child: Container(
                            width: 32,
                            height: 32,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.white),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: Color(0xff0A7E80),
                            )),
                      ),
                      const Expanded(
                        child: Text(
                          "Edit Profile",
                          textAlign: TextAlign
                              .center, // Center the text within its expanded space.
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Opacity(
                        opacity: 0.0, // Make the mirror widget invisible.
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
