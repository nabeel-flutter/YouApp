import 'package:flutter/material.dart';
import 'package:e_finder/src/data/dto/get_profile_dto.dart';

class HomeCardComponent extends StatelessWidget {
  const HomeCardComponent({
    super.key,
    required this.profile,
    required this.body,
  });

  final GetProfileDto profile;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 27),
        decoration: BoxDecoration(
            color: Color(0xff0E191F), borderRadius: BorderRadius.circular(14)),
        child: body);
  }
}
