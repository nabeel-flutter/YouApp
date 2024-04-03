import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/my_logs/components/mylogs_body.dart';
import 'package:new_beginnings/src/pages/my_logs/cubit/logs_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyLogs extends StatelessWidget {
  const MyLogs({super.key});

  @override
  Widget build(BuildContext context) {
    // Initiating data loading as soon as the widget is built
    context.read<LogsCubit>().getLogsData();

    return BlocConsumer<LogsCubit, LogsState>(
      listener: (context, state) {
        // This is where you can handle state-specific actions, if any.
      },
      builder: (context, state) => state.maybeWhen(
        // Handling different states with appropriate UI responses
        orElse: () => Container(), // Default case for unspecified states
        error: (message) => ErrorState(
          // Displaying error message with a retry option
          message: message,
          onTap: () =>
              context.read<LogsCubit>().getLogsData(), // Retry fetching data
        ),
        loading: () => const Skeletonizer(
            child: MyLogsBody()), // Showing a placeholder while data is loading
        loaded: (logsData) => MyLogsBody(
            logDetails:
                logsData), // Displaying the logs data upon successful load
      ),
    );
  }
}
