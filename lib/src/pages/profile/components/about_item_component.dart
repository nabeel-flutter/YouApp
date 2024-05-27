import 'package:flutter/material.dart';

class AboutItemsComponent extends StatelessWidget {
  const AboutItemsComponent({
    super.key,
    required this.dynamicKey,
    required this.value,
  });
  final String dynamicKey;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        child: Row(children: [
          RichText(
              text: TextSpan(
                  text: '${dynamicKey} ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.33),
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                  children: [
                TextSpan(
                    text: value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13))
              ]))
        ]));
  }
}

