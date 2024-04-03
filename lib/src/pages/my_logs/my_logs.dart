import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_beginnings/src/pages/my_logs/cubit/mylogs_cubit.dart';
import 'package:new_beginnings/src/pages/my_logs/cubit/mylogs_state.dart';

class MyLogs extends StatelessWidget {
  const MyLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(),
      child: BlocBuilder<LogCubit, LogState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return CircularProgressIndicator();
          } else if (state is DataLoaded) {
            return Text('Data: ${state.data}');
          } else if (state is DataError) {
            return Text('Error: ${state.message}');
          }
          return ElevatedButton(
            onPressed: () => context.read<LogCubit>().fetchData(),
            child: Text('Load Data'),
          );
        },
      ),
    );
  }
}
