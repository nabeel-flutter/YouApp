import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/notification/model/notification_data_model.dart';

class NotificationTileComponent extends StatelessWidget {
  const NotificationTileComponent({
    super.key,
    required this.notification,
  });
  final MapEntry<int, AppNotification> notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xff80BCBD)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 2),
            child: Image.asset(
              notification.value.image,
              width: 70,
              height: 70,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.value.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: FontConstants.gilroySemiBold,
                        fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 250,
                  child: Text(notification.value.decs,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontFamily: FontConstants.gilroyMedium,
                          fontSize: 12,
                          color: !getThemeStateIsLight()
                              ? darken(getThemeColor(context), 0.2)
                              : lighten(getThemeColor(context), 0.3))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0, right: 10),
            child: Text(notification.value.date,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontFamily: FontConstants.gilroyMedium,
                    color: !getThemeStateIsLight()
                        ? darken(getThemeColor(context), 0.2)
                        : lighten(getThemeColor(context), 0.3))),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
