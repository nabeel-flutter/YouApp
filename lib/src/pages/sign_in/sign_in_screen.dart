import 'package:auto_route/auto_route.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:e_finder/src/constant/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/components/main_scaffold.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/pages/sign_in/components/sign_in_form.dart';
import 'package:e_finder/src/custom_widgets/custom_clip_path.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  late AnimationController _leftAnimationController;
  late AnimationController _rightAnimationController;
  late Animation<Offset> _leftOffsetAnimation;
  late Animation<Offset> _rightOffsetAnimation;

  @override
  void initState() {
    // TODO: implement initState

    _leftAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _rightAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _leftOffsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _leftAnimationController,
      curve: Curves.easeInOut,
    ));

    _rightOffsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _rightAnimationController,
      curve: Curves.easeInOut,
    ));

    // Start the animations
    _leftAnimationController.forward();
    _rightAnimationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MainScaffold(
      isAuth: true,
      isGradient: false,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      // color: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              SlideTransition(
                position: _rightOffsetAnimation,
                child: Image.asset(
                  AssetsConstants.cartIconLoginScreen,
                  width: width * 0.20,
                  height: width * 0.20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: _rightOffsetAnimation,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.45,
                    child: const Divider(color: Colors.white),
                  ),
                  SizedBox(height: height * 0.03),
                  const DelayedDisplay(
                    delay: Duration(seconds: 0),
                    fadingDuration: Duration(seconds: 1),
                    child: Text(
                      "Welcome! Let's Get You Started",
                      style: TextStyle(
                        color: Color(0xFF9747FF),
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
