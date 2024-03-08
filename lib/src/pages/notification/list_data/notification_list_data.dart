import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/notification/model/notification_data_model.dart';

List<AppNotification> notificationList = [
  AppNotification(
    date: '12:30 PM',
    decs:
        'The New Appointment has been scheduled for tomorrow at 6:00 pm to 06:30 pm.',
    image: AssetsConstants.newappointmenticon,
    isNew: true,
    title: 'New Appointment',
  ),
  AppNotification(
    date: '2:08 PM',
    decs: 'Your timing for next appointment has been changed.',
    image: AssetsConstants.timechnagedicon,
    isNew: true,
    title: 'Timming Chnaged',
  ),
  AppNotification(
    date: '4:15 PM',
    decs: 'Your payment for newly schedule appointment has been received. ',
    image: AssetsConstants.paymentreceivedicon,
    isNew: false,
    title: 'Payment Received',
  ),
];
