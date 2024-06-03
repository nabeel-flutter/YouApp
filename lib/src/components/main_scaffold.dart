import 'package:e_finder/src/custom_widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final bool? isGradient;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final double? preferredSizeAppBar;
  final Widget? floatingActionButton;
  final Color? color;
  final bool? isAuth;

  const MainScaffold({
    super.key,
    required this.body,
    this.isGradient,
    this.isLinearGradient = false,
    this.isAuth = false,
    this.appBar,
    this.bottomNavigationBar,
    this.preferredSizeAppBar = kToolbarHeight * 1.4,
    this.floatingActionButton,
    this.color,
  });

  final Widget body;
  final bool isLinearGradient;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white,
        ),
        isGradient == true
            ? Image.asset(
                isLinearGradient == true
                    ? 'assets/images/liner_gradient_bg.png'
                    : 'assets/images/bg_image.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )
            : Container(
                decoration: const BoxDecoration(color: Colors.white),
              ),
        if (isAuth == true)
          Stack(
            children: [
              ClipPath(
                clipper: CurvedButtonClipper2(),
                child: Container(
                  color: Color(0xffa180e9).withOpacity(0.5),
                  height: height * 0.2,
                ),
              ),
              ClipPath(
                clipper: CurvedButtonClipper(),
                child: Container(
                  color: Color(0xffa180e9),
                  height: height * 0.18,
                ),
              ),
              ClipPath(
                clipper: CurvedButtonClipper(),
                child: Container(
                  color: Color(0xffa180e9).withOpacity(0.7),
                  height: height * 0.24,
                ),
              ),
            ],
          ),
        Scaffold(
          
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: color ?? Colors.transparent,
          appBar: appBar != null
              ? PreferredSize(
                  preferredSize: Size.fromHeight(
                      preferredSizeAppBar ?? kToolbarHeight + 1),
                  child: appBar!)
              : null,
          body: body,
        ),
      ],
    );
  }
}
