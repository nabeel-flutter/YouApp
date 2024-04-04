import 'package:flutter/material.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';

Widget buildLogDataView(LogDetails? logDetails, BuildContext context) {
  if (logDetails?.data == null || logDetails!.data!.isEmpty) {
    return const Center(child: Text("No log data available"));
  } else {
    return ListView.builder(
      itemCount: logDetails!.data!.length,
      itemBuilder: (context, index) {
        return _buildLogItem(logDetails.data![index], context);
      },
    );
  }
}

Widget _buildLogItem(LogData logData, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            _buildGroupedFields(
              'Appointment ID',
              logData.id!.substring(0, 6),
              'Time Slot',
              logData.timeSlot!,
              'Payment Type',
              logData.paymentType!,
            ),
            _buildGroupedFields(
              'Date of Service (DOS)',
              logData.appointmentDate!.substring(0, 10),
              'Location',
              logData.location!.substring(0, 11),
              'Payment Status',
              logData.paymentStatus!,
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    ),
  );
}

Widget _buildGroupedFields(String title1, String content1, String title2,
    String content2, String title3, String content3) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title1),
        Text(content1,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff023E3F))),
        const SizedBox(height: 8.0),
        Text(title2),
        Text(content2,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff023E3F))),
        const SizedBox(height: 8.0),
        Text(title3),
        Text(content3,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff023E3F))),
      ],
    ),
  );
}
