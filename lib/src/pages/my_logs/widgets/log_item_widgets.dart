import 'package:flutter/material.dart';
import 'package:new_beginnings/src/core/extension/string_extension.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';

class LogDataView extends StatelessWidget {
  final LogDetails? logDetails;

  const LogDataView({Key? key, this.logDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (logDetails?.data == null || logDetails!.data!.isEmpty) {
      return const Center(child: Text("No log data available"));
    } else {
      return ListView.builder(
        itemCount: logDetails!.data!.length,
        itemBuilder: (context, index) {
          return LogItem(logData: logDetails!.data![index]);
        },
      );
    }
  }
}

class LogItem extends StatelessWidget {
  final LogData logData;

  const LogItem({Key? key, required this.logData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              GroupedFields(
                title1: 'Appointment ID',
                content1: logData.id!.substring(0, 6),
                title2: 'Time Slot',
                content2: logData.timeSlot!,
                title3: 'Payment Type',
                content3: logData.paymentType!.toCapitalized(),
              ),
              GroupedFields(
                title1: 'Date of Service (DOS)',
                content1: logData.appointmentDate!.substring(0, 10),
                title2: 'Location',
                content2: logData.location!.substring(0, 11),
                title3: 'Payment Status',
                content3: logData.paymentStatus!.toCapitalized(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
        ],
      ),
    );
  }
}

class GroupedFields extends StatelessWidget {
  final String title1;
  final String content1;
  final String title2;
  final String content2;
  final String title3;
  final String content3;

  const GroupedFields({
    Key? key,
    required this.title1,
    required this.content1,
    required this.title2,
    required this.content2,
    required this.title3,
    required this.content3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
