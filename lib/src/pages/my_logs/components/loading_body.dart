import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';
import 'package:new_beginnings/src/pages/my_logs/widgets/log_item_widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        body: Skeletonizer(
          child: buildLogDataView(logDetails, context),
        ));
  }
}
