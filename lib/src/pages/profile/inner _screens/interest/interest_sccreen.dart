import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/my_profile_page.dart';
import 'package:your_app_test/src/pages/sign_in/components/sign_in_form.dart';

@RoutePage()
class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController interestController = TextEditingController();
  final List<String> interestList = [];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        isGradient: true,
        appBar: AppBarWidget(
          actions: [
            Container(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Save',
                      style: TextStyle(
                        // height: 1.5,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..shader = linearGradientText(colors: [
                            Color(0xffABFFFD),
                            Color(0xff4599DB),
                            Color(0xffAADAFF),
                          ]),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                ],
              ),
            )
          ],
          isBack: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Tell everyone about yourself',
                  style: TextStyle(
                    // height: 1.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()
                      ..shader = linearGradientText(colors: [
                        Color(0xff94783E),
                        Color(0xffF3EDA6),
                        Color(0xffF8FAE5),
                        Color(0xffFFE2BE),
                        Color(0xffD5BE88),
                        Color(0xffF8FAE5),
                        Color(0xffD5BE88),
                      ]),
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ),
              SizedBox(height: 12),
              Text('What interest you?',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)),
              SizedBox(height: 35),
              ChipTextFieldScreen()
            ],
          ),
        ));
  }
}

class ChipTextFieldScreen extends StatefulWidget {
  const ChipTextFieldScreen({super.key});

  @override
  State<ChipTextFieldScreen> createState() => _ChipTextFieldScreenState();
}

class _ChipTextFieldScreenState extends State<ChipTextFieldScreen> {
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
