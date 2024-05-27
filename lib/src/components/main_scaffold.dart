import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final bool? isGradient;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final double? preferredSizeAppBar;
  final Widget? floatingActionButton;

  const MainScaffold({
    super.key,
    required this.body,
    this.isGradient,
    this.appBar,
    this.bottomNavigationBar,
    this.preferredSizeAppBar = kToolbarHeight * 1.4,
    this.floatingActionButton,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        isGradient == true
            ? Image.asset(
                'assets/images/bg_image.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )
            : Container(
                decoration: const BoxDecoration(color: Color(0xff09141A)),
              ),
        Scaffold(
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: Colors.transparent,
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
