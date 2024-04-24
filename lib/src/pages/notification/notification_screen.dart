import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/notification/components/notification_tile_component.dart';
import 'package:your_app_test/src/pages/notification/list_data/notification_list_data.dart';

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
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                  child: Text(
                    "Today",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  )),
              Column(
                children: notificationList
                    .asMap()
                    .entries
                    .map((notification) => Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 85,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: ColorConstants.redIndicatorColor),
                            child: const Icon(
                              Icons.delete,
                              color: ColorConstants.white,
                              size: 30,
                            ),
                          ),
                        ),
                        key: Key(notification.key.toString()),
                        child: NotificationTileComponent(
                            notification: notification)))
                    .toList(),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                  child: Text(
                    "Yesterday",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  )),
              Column(
                children: notificationList
                    .asMap()
                    .entries
                    .map((notification) => Dismissible(
                        key: Key(notification.key.toString()),
                        direction: DismissDirection.endToStart,
                        background: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 85,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: ColorConstants.redIndicatorColor),
                            child: const Icon(
                              Icons.delete,
                              color: ColorConstants.white,
                              size: 30,
                            ),
                          ),
                        ),
                        child: NotificationTileComponent(
                            notification: notification)))
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
