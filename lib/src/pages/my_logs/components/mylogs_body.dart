import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart'; // Assuming this includes app-wide constants or styles.
import 'package:new_beginnings/src/pages/my_logs/model/mylogs_model.dart'; // Adjusted import path for consistency with the provided model classes.

class MyLogsBody extends StatelessWidget {
  final LogDetails? logDetails;

  const MyLogsBody({
    Key? key,
    this.logDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      isAppBar: true,
      body: _buildLogDataView(),
      isBackAppBar: false,
      appbarText: "Logs",
    );
  }

  Widget _buildLogDataView() {
    if (logDetails?.data == null || logDetails!.data!.isEmpty) {
      return const Center(child: Text("No log data available"));
    } else {
      return ListView.builder(
        itemCount: logDetails!.data!.length,
        itemBuilder: (context, index) {
          return _buildLogItem(logDetails!.data![index]);
        },
      );
    }
  }

  Widget _buildLogItem(LogData logData) {
    return Card(
      child: ListTile(
        title: Text(logData.method ?? "No method specified"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Appointment Date: ${logData.appointmentDate ?? "Not specified"}'),
            Text('Service Name: ${logData.serviceName ?? "Not specified"}'),
            Text('Location: ${logData.location ?? "Not specified"}'),
            Text(
                'Price: \$${logData.price?.toStringAsFixed(2) ?? "Not specified"}'),
          ],
        ),
        leading: logData.avatar != null
            ? CircleAvatar(backgroundImage: NetworkImage(logData.avatar!))
            : const Icon(Icons.event_note),
        trailing: Text(logData.createdAt ?? "No date"),
      ),
    );
  }
}
