import 'package:new_beginnings/src/app/app_export.dart';

List<BillingList> paymentList = [
  BillingList(
      text: 'Payment Details',
      route: RouteConstants.paymentRoute,
      args: BillingArgs(pageIndex: 0)),
  BillingList(
      text: 'Payment Log',
      route: RouteConstants.paymentRoute,
      args: BillingArgs(pageIndex: 1)),
];
