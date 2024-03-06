import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/payment/inner_page/my_payment/components/payment_responsibility_pop_up.dart';

class ClaimDetailsComponent extends StatefulWidget {
  const ClaimDetailsComponent({
    super.key,
    required this.heading,
    required this.value,
  });

  final String heading;
  final String value;

  @override
  State<ClaimDetailsComponent> createState() => _ClaimDetailsComponentState();
}

class _ClaimDetailsComponentState extends State<ClaimDetailsComponent> {
  String? selectedPaymentMethod;

  TextEditingController amountController = TextEditingController();
  TextEditingController patientResponsibilityController =
      TextEditingController();
  TextEditingController advancePaymentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        if (widget.heading.toLowerCase() == 'action'.toLowerCase()) {
          ShowBottomSheetComponent().showBottomSheet(
              removePadding: true,
              isControlled: true,
              removeHeight: true,
              content: StatefulBuilder(
                builder: (context, setState) => PaymentResponsibilityComponent(
                  advancePaymentController: advancePaymentController,
                  amountController: amountController,
                  patientResponsibilityController:
                      patientResponsibilityController,
                  selectedItemPayemntMethod: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                  selectedPaymentMethod: selectedPaymentMethod,
                  onDropdownFieldTapPayemntMethod: () {
                    setState(() {
                      selectedPaymentMethod = null;
                    });
                  },
                ),
              ),
              context: context);
        }
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.heading,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontFamily: FontConstants.gilroyMedium,
                      color: getThemeStateIsLight()
                          ? lighten(getThemeColor(context), 0.3)
                          : darken(getThemeColor(context), 0.35),
                    )),
            Text(widget.value,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontFamily: FontConstants.gilroyMedium,
                    ))
          ]),
    ));
  }
}
