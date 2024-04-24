import 'package:your_app_test/src/app/app_export.dart';

class GenderSelection extends StatefulWidget {
  final String initialSelction; // Add this line
  final Function(String) onGenderSelect; // Add this line

  const GenderSelection({
    super.key,
    required this.initialSelction,
    required this.onGenderSelect,
  });

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int? _selectedValue;
  @override
  void initState() {
    super.initState();
    // Set the initial value based on the passed initialPaymentMode
    if (widget.initialSelction == "Male") {
      _selectedValue = 1;
    } else if (widget.initialSelction == "Female") {
      _selectedValue = 2;
    } else if (widget.initialSelction == "Other") {
      _selectedValue = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff403B3B)),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedValue = 1;
                  widget.onGenderSelect("Male");
                });
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedValue == 1
                          ? ColorConstants.primaryTextColor
                          : ColorConstants.widgetBgColor.withOpacity(0.37),
                      border: Border.all(
                        color: ColorConstants.primaryTextColor,
                        width: 0.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    StringConstants.male,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedValue = 2;
                  widget.onGenderSelect("Female");
                });
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedValue == 2
                          ? ColorConstants.primaryTextColor
                          : ColorConstants.widgetBgColor.withOpacity(0.37),
                      border: Border.all(
                        color: ColorConstants.primaryTextColor,
                        width: 0.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    StringConstants.female,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedValue = 3;
                  widget.onGenderSelect("Other");
                });
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedValue == 3
                          ? ColorConstants.primaryTextColor
                          : ColorConstants.widgetBgColor.withOpacity(0.37),
                      border: Border.all(
                        color: ColorConstants.primaryTextColor,
                        width: 0.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Other",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
