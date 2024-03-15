import 'package:new_beginnings/src/app/app_export.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key, required this.isInsured,
  });
  final bool isInsured;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 408,
        width: 343,
        decoration: BoxDecoration(
            color: lighten(getThemeColor(context), 0.4),
            borderRadius: BorderRadius.circular(24),
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0A7E80), // darker teal color for the top
                Color(0xFF76c8c6)
                    .withOpacity(0.8) // lighter teal color for the bottom
              ],
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsConstants.successDialogImage,
                  width: 156, height: 156),
              Text(isInsured?"Request Generated" :'Payment Success!',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: darken(getThemeColor(context), 0.3),
                      fontFamily: FontConstants.gilroySemiBold)),
              Container(
                width: 260,
                child: Text(
                    'We are delighted to inform you that we received your ${isInsured?"request":"payment"}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: darken(getThemeColor(context), 0.3),
                        fontFamily: FontConstants.gilroyMedium)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: BottomNavBarAppointmentBookScreen(
                    fgColor: Colors.white,
                    bgColor: Color(0xff023E3F),
                    text: 'Okay',
                    onTap: () {
                      Navigator.pop(context);
                      // AlertDialogComponent.showDialogComponent(
                      //     alertDialog: const AlertDialog(
                      //         insetPadding: EdgeInsets.all(16),
                      //         contentPadding: EdgeInsets.zero,
                      //         content: BookingConfirmationDialog()),
                      //     context: context);
                    }),
              )
            ]));
  }
}
