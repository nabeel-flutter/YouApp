import 'package:flutter/material.dart';
import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/my_logs/model/my_logs_model.dart';
import 'package:your_app_test/src/pages/my_logs/widgets/log_item_widgets.dart';
import 'package:shimmer/shimmer.dart'; // Ensure you have added this package to your pubspec.yaml

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
              List.generate(10, (index) => const ShimmerContainer()).toList(),
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 130.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
