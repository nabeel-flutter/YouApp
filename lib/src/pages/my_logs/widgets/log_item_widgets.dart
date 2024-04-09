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
                fields: [
                  FieldData(
                    title: 'Appointment ID',
                    content: logData.id!.substring(0, 6),
                  ),
                  FieldData(
                    title: 'Time Slot',
                    content: logData.timeSlot!,
                  ),
                  FieldData(
                    title: 'Patient Type',
                    content: logData.paymentType!.toCapitalized(),
                  ),
                  FieldData(
                    title: 'Service Name',
                    content: logData.serviceName!,
                  ),
                ],
              ),
              GroupedFields(
                fields: [
                  FieldData(
                    title: 'Date of Service (DOS)',
                    content: logData.appointmentDate!.substring(0, 10),
                  ),
                  FieldData(
                    title: 'Location',
                    content: logData.location!.substring(0, 11),
                  ),
                  FieldData(
                    title: 'Payment Status',
                    content: logData.paymentStatus!.toCapitalized(),
                  ),
                  FieldData(
                      title: 'App type',
                      content: logData.request!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
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
  final List<FieldData> fields;

  const GroupedFields({
    Key? key,
    required this.fields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fields.map((field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(field.title),
              Text(
                field.content,
                maxLines: field.maxLines,
                overflow: field.overflow,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff023E3F),
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class FieldData {
  final String title;
  final String content;
  final int? maxLines;
  final TextOverflow? overflow;

  FieldData({
    required this.title,
    required this.content,
    this.maxLines,
    this.overflow,
  });
}
