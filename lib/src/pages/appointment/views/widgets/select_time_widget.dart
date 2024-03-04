import 'package:new_beginnings/src/app/app_export.dart';

class SelectTimeWidget extends StatefulWidget {
  final void Function(String?) onSelectedTime;

  const SelectTimeWidget({Key? key, required this.onSelectedTime})
      : super(key: key);

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
          StringConstants.timeSlot,
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
            4,
            (index) => ChoiceChip(
              showCheckmark: false,
              label: const Text('10:00 AM'),
              selected: selectedChipIndex == index,
              onSelected: (isSelected) {
                setState(() {
                  selectedChipIndex = isSelected ? index : null;
                });
                widget.onSelectedTime(isSelected ? '10:00 AM' : null);
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
