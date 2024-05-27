import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/pages/profile/components/profile_chip_component.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';

class ChipInputField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onAddChip;
  final Function(String) onRemoveChip;

  ChipInputField({
    super.key,
    required this.textController,
    required this.onAddChip,
    required this.onRemoveChip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFD9D9D9).withOpacity(0.06)),
      child: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines

        children: [
          ...BlocProvider.of<GetProfileCubit>(context)
              .profileData!
              .interests!
              .map((chip) {
            return ProfileChipsComponent(
              title: chip,
              isDelete: true,
              onDelete: () => onRemoveChip(chip),
            );
          }).toList(),
          Container(
            constraints: BoxConstraints(
              maxWidth: 200.0, // Maximum width for the text field
            ),
            child: IntrinsicWidth(
              child: TextField(
                controller: textController,
                style: TextStyle(
                    color: Colors.white), // Set input text style to white
                decoration: InputDecoration(
                    hintText: 'Enter here',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFFD9D9D9).withOpacity(0.06)),
                onSubmitted: onAddChip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
