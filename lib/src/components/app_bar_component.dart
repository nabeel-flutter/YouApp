import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/color_constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.title = '',
    this.actions,
    this.isBack = false,
  });
  final String? title;

  final List<Widget>? actions;
  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: isBack == true ? 100 : null,
        leading: isBack == true
            ? InkWell(
                onTap: () {
                  context.router.maybePop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        size: 17,
                        Icons.arrow_back_ios,
                        color: ColorConstants.white),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 16,
                        height: 1.7,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            : null,
        title: Text(title!,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
        centerTitle: true,
        actions: actions);
  }
}
