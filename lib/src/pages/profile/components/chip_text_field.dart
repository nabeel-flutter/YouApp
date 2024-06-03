import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/pages/profile/components/chip_input_field.dart';
import 'package:e_finder/src/pages/profile/cubit/get_profile_cubit.dart';

class ChipTextField extends StatefulWidget {
  const ChipTextField({super.key});

  @override
  State<ChipTextField> createState() => _ChipTextFieldState();
}

class _ChipTextFieldState extends State<ChipTextField> {
  final TextEditingController _textController = TextEditingController();

  void _addChip(String text) {
    if (text.trim().isNotEmpty &&
        !BlocProvider.of<GetProfileCubit>(context)
            .profileData!
            .interests!
            .contains(text.trim())) {
      setState(() {
        BlocProvider.of<GetProfileCubit>(context)
            .profileData!
            .interests!
            .add(text.trim());
      });
      _textController.clear();
    }
  }

  void _removeChip(String chip) {
    setState(() {
      BlocProvider.of<GetProfileCubit>(context)
          .profileData!
          .interests!
          .remove(chip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ChipInputField(
            textController: _textController,
            onAddChip: _addChip,
            onRemoveChip: _removeChip,
          ),
        ],
      ),
    );
  }
}
