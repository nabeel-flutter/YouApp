import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';
import 'package:new_beginnings/src/pages/my_logs/widgets/log_item_widgets.dart';

class LoadingBody extends StatelessWidget {
  final LogDetails? logDetails;

  const LoadingBody({
    super.key,
    this.logDetails,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
        isAppBar: true,
        body: logDetails == null ? const LoadingView() : const LogDataView());
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 8.0;
    const EdgeInsets padding = EdgeInsets.all(8.0);

    return Padding(
      padding: padding,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 15.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
