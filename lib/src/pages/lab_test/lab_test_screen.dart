import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/lab_test/components/lab_test_list.dart';
import 'package:your_app_test/src/pages/lab_test/components/lab_test_search_bar.dart';

class LabTestScreen extends StatelessWidget {
  const LabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAppBar(title: "Lab Tests"),
              SizedBox(height: 20),
              LabTestSearchBar(),
              SizedBox(height: 20),
              LabTestList(),
            ],
          ),
        ),
      ),
    );
  }
}
