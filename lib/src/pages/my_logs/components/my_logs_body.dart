import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/my_logs/model/my_logs_model.dart';
import 'package:new_beginnings/src/pages/my_logs/widgets/log_item_widgets.dart';

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
      body: LogDataView(
        logDetails: logDetails,
      ),
      isBackAppBar: false,
      appbarText: "Logs",
    );
  }
}
