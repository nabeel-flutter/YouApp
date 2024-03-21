import 'package:new_beginnings/src/app/app_export.dart';

class FailedDialog extends StatelessWidget {
  const FailedDialog({
    super.key,
  });

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
                const Color(0xFF0A7E80), // darker teal color for the top
                const Color(0xFF76c8c6)
                    .withOpacity(0.8) // lighter teal color for the bottom
              ],
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsConstants.failedDialogImage,
                  width: 156, height: 156),
              Text('Payment Denied!',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: darken(getThemeColor(context), 0.3),
                      fontFamily: FontConstants.gilroySemiBold)),
              SizedBox(
                width: 260,
                child: Text(
                    'Unfortunately we have an issue with your payment, try again later ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: darken(getThemeColor(context), 0.3),
                        fontFamily: FontConstants.gilroyMedium)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: BottomNavBarAppointmentBookScreen(
                    fgColor: Colors.white,
                    bgColor: const Color(0xff023E3F),
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
