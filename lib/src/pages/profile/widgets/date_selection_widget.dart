import 'package:new_beginnings/src/app/app_export.dart';

class DateSelectionWidget extends StatefulWidget {
  final void Function(String?) onDateSelected;
  final String? initialDate; // Add this line

  const DateSelectionWidget({
    Key? key,
    required this.onDateSelected,
    this.initialDate, // Add this line
  }) : super(key: key);

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  late String selectedDateText; // Change this line

  @override
  void initState() {
    super.initState();
    // Set the initial selectedDateText based on the initialDate passed from the parent widget
    selectedDateText = widget.initialDate ?? "Select your date of birth";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDateText = DateFormat('yyyy-MM-dd').format(picked);
      });
      widget.onDateSelected(selectedDateText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of Birth",
          style: TextStyle(
            color: ColorConstants.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xff80BCBD).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorConstants.primaryColor,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: ColorConstants.greenish,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  selectedDateText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: ColorConstants.hintTextColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
