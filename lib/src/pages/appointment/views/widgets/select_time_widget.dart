import 'package:your_app_test/src/app/app_export.dart';

class SelectTimeWidget extends StatefulWidget {
  final void Function(String?) onSelectedTime;
  final List<String> timeOptions;

  const SelectTimeWidget({
    Key? key,
    required this.onSelectedTime,
    required this.timeOptions,
  }) : super(key: key);

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  int? selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Preferred Time",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorConstants.primaryColor,
              ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 5,
          children: List.generate(
            widget.timeOptions.length,
            (index) => ChoiceChip(
              showCheckmark: false,
              label: Text(widget.timeOptions[index]),
              selected: selectedChipIndex == index,
              onSelected: (isSelected) {
                setState(() {
                  selectedChipIndex = isSelected ? index : null;
                });
                widget.onSelectedTime(isSelected ? widget.timeOptions[index] : null);
              },
              selectedColor: ColorConstants.primaryTextColor,
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: ColorConstants.white,
                  ),
              backgroundColor: ColorConstants.widgetBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
