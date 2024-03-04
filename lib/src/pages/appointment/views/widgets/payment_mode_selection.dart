import 'package:new_beginnings/src/app/app_export.dart';

class PaymentModeSelection extends StatefulWidget {
  const PaymentModeSelection({Key? key}) : super(key: key);

  @override
  State<PaymentModeSelection> createState() => _PaymentModeSelectionState();
}

class _PaymentModeSelectionState extends State<PaymentModeSelection> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Mode',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorConstants.primaryColor,
              ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedValue = 1;
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
                    StringConstants.insurance,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
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
                    StringConstants.selfPay,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
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
