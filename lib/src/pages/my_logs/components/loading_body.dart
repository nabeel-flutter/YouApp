import 'package:flutter/material.dart';
import 'package:new_beginnings/src/pages/my_logs/components/my_logs_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(child: MyLogsBody());
  }
}
