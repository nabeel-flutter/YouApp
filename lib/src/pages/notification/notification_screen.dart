import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/notification/components/notification_tile_component.dart';
import 'package:new_beginnings/src/pages/notification/list_data/notification_list_data.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                  child: Text(
                    "Today",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  )),
              Column(
                children: notificationList
                    .asMap()
                    .entries
                    .map((notification) =>
                        NotificationTileComponent(notification: notification))
                    .toList(),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                  child: Text(
                    "Yesterday",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  )),
              Column(
                children: notificationList
                    .asMap()
                    .entries
                    .map((notification) =>
                        NotificationTileComponent(notification: notification))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      isGradient: false,
      appBar: AppBarcomponent(
          isGradient: false,
          title: StringConstants.notification,
          isBackAppBar: true,
          isTitleTowLines: false),
    );
  }
}
