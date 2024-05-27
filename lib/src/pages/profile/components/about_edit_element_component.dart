import 'package:flutter/material.dart';

class AboutEditElementWidget extends StatelessWidget {
  const AboutEditElementWidget({
    super.key,
    required this.title,
    required this.field,
  });

  final String title;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffFFFFFF).withOpacity(.33),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffFFFFFF).withOpacity(0.22),
                ),
              ),
              child: field,
            ),
          ),
        ],
      ),
    );
  }
}
