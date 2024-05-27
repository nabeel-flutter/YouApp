
import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileChipsComponent extends StatelessWidget {
  const ProfileChipsComponent({
    Key? key,
    this.title,
    this.onDelete,
    this.isDelete,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onDelete;
  final bool? isDelete;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isDelete == true ? 10 : 100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(isDelete == true ? 10 : 100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Make the Row fit its content
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.23,
                  ),
                ),
                if (isDelete == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: onDelete,
                        child: Icon(
                          Icons.close,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
