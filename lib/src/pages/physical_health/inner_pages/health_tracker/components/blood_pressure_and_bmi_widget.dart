import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/physical_health/inner_pages/health_tracker/components/bmi_widget.dart';

class BloodPressureAndBmiWidget extends StatelessWidget {
  const BloodPressureAndBmiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [BloodPressureWidget(), SizedBox(width: 5), BMIWidget()],
      ),
    );
  }
}
