import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/color_constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.enabled,
    this.isErrorButton = false,
  });

  final VoidCallback onPressed;
  final String title;
  final bool enabled;
  final bool? isErrorButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
            autofocus: false,
            style: isErrorButton == true
                ? disableStyle(isErrorButton: isErrorButton)
                : enabled == true
                    ? null
                    : disableStyle(),
            onPressed: enabled == true ? () => onPressed() : null,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            )),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorConstants.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
        )
      ],
    );
  }

  ButtonStyle disableStyle({bool? isErrorButton = false}) {
    return ButtonStyle(
        shape: WidgetStateProperty.resolveWith((states) {
          return DecoratedOutlinedBorder(
              shadow: isErrorButton == true
                  ? [
                      GradientShadow(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color.fromARGB(255, 205, 98, 98)
                                    .withOpacity(0.5),
                                Color.fromARGB(255, 219, 69, 69)
                                    .withOpacity(0.5),
                              ]),
                          blurRadius: 100,
                          offset: const Offset(0, 14))
                    ]
                  : [],
              backgroundGradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: isErrorButton == true
                      ? [
                          Color.fromARGB(255, 205, 98, 98),
                          Color.fromARGB(255, 219, 69, 69)
                        ]
                      : [
                          Color.fromARGB(255, 205, 98, 205).withOpacity(0.5),
                          Color.fromARGB(255, 219, 69, 212).withOpacity(0.5)
                        ]),
              child: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)));
        }),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent));
  }
}
