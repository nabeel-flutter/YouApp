import 'package:your_app_test/src/app/app_export.dart';

class SelectDateWidget extends StatefulWidget {
  final void Function(DateTime?) onDateSelected;
  const SelectDateWidget({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.selectDate,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorConstants.primaryColor, // Adjust color as needed
              ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorConstants.widgetBgColor, // Adjust color as needed
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstants
                          .primaryTextColor, // Adjust color as needed
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Center(
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'Select a Date',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black, // Adjust color as needed
                          ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
