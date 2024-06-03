import 'package:auto_route/auto_route.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:e_finder/src/constant/assets_constants.dart';
import 'package:e_finder/src/constant/route_constants.dart';
import 'package:e_finder/src/constant/shared_preference_constants.dart';
import 'package:e_finder/src/di/injector.dart';
import 'package:e_finder/src/util/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Color _backgroundColor;
  bool _showAdditionalContainer = false;

  List<String> texts = [
    "Report lost and found vehicles, humans, objects, and pets",
    "Real-Time Location Tracking and Notifications.",
    "OCR Technology and Visual Mapping for efficient searches.",
    "Facial recognition technology for swift recovery.",
    "Community Engagement and Ads Promotion",
  ];
  int textIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    //-------//-----///

    _backgroundColorAnimation = ColorTween(
      begin: const Color.fromRGBO(161, 128, 233, 1),
      end: const Color.fromRGBO(242, 238, 251, 1),
    ).animate(_controller);

    _backgroundColor = const Color.fromRGBO(161, 128, 233, 1);

    _controller.addListener(() {
      setState(() {
        _backgroundColor =
            _backgroundColorAnimation.value ?? Colors.transparent;
        if (_controller.status == AnimationStatus.completed) {
          _showAdditionalContainer = true;
          _updateText();
        }
      });
    });

    _controller.forward();
  }

  void _updateText() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          textIndex = (textIndex + 1) % texts.length;
        });
        _updateText();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: DelayedDisplay(
                    delay: const Duration(seconds: 0),
                    fadingDuration: const Duration(seconds: 1),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.2),
                      child: SvgPicture.asset(
                        AssetsConstants.splashLogo,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              if (_showAdditionalContainer)
                Container(
                  height: MediaQuery.of(context).size.height * 0.56,
                  width: MediaQuery.of(context).size.width,
                  child: DelayedDisplay(
                    delay: const Duration(seconds: 0),
                    fadingDuration: const Duration(seconds: 1),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.7,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SvgPicture.asset(
                              AssetsConstants.splashIntroImage,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              texts[textIndex],
                              style: TextStyle(
                                color: Color(0xffa180e9),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < texts.length; i++)
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01),
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                  height:
                                      MediaQuery.of(context).size.width * 0.02,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i == textIndex
                                        ? Color(0xffa180e9)
                                        : Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_showAdditionalContainer)
                SlideTransition(
                  position: _offsetAnimation,
                  child: GestureDetector(
                    onTap: () async {
                      await getIt.get<SharedPreferencesUtil>().setBool(
                          SharedPreferenceConstants.introScreenSeen,
                          value: true);
                      context.router.pushNamed(RouteConstants.signInRoute);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width,
                      child: DelayedDisplay(
                        delay: const Duration(seconds: 0),
                        fadingDuration: const Duration(seconds: 1),
                        child: Container(
                          child: Image.asset(
                            AssetsConstants.onboardingContinueButton,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
