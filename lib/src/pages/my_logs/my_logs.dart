import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/my_logs/components/loading_body.dart';

import 'package:new_beginnings/src/pages/my_logs/cubit/logs_cubit.dart';
import 'package:new_beginnings/src/pages/my_logs/components/my_logs_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyLogs extends StatelessWidget {
  const MyLogs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LogsCubit>().getLogsData();

    return BlocConsumer<LogsCubit, LogsState>(
      listener: (context, state) {},
      builder: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        error: (message) => ErrorState(
          message: message,
          onTap: () => context.read<LogsCubit>().getLogsData(),
        ),
        loading: () => const LoadingBody(),
        loaded: (logsData) => MyLogsBody(logDetails: logsData),
      ),
    );
  }
}
