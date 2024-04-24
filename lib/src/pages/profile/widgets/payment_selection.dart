import 'package:your_app_test/src/app/app_export.dart';

class PaymentSelection extends StatefulWidget {
  final String initialPaymentMode; // Add this line
  final Function(bool isInsured) onSelectionChange;
  final Function(String) onPaymentSelect; // Add this line
  const PaymentSelection(
      {super.key,
      required this.initialPaymentMode,
      required this.onSelectionChange,
      required this.onPaymentSelect});

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  int? _selectedValue;

  @override
  void initState() {
    super.initState();
    // Set the initial value based on the passed initialPaymentMode
    if (widget.initialPaymentMode == "insured") {
      _selectedValue = 1;
    } else if (widget.initialPaymentMode == "selfPay") {
      _selectedValue = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.paymentMode,
          style: const TextStyle(
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
                  _selectedValue = 1; // or 2 for self-pay
                  widget.onPaymentSelect("insured");
                });
                widget.onSelectionChange(
                    true); // true if insured, false otherwise
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
                    StringConstants.insured,
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
                  widget.onPaymentSelect("selfPay");
                });
                widget.onSelectionChange(false);
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
                    StringConstants.selfPay,
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
