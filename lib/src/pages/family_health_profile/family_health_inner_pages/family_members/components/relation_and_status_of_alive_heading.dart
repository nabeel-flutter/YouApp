import 'package:new_beginnings/src/app/app_export.dart';

class RelationAndStatusOfAliveHeading extends StatelessWidget {
  const RelationAndStatusOfAliveHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Relation',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontFamily: FontConstants.gilroySemiBold),
            ),
          ),
          Expanded(
            child: Text(
              'Alive',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontFamily: FontConstants.gilroySemiBold),
            ),
          )
        ],
      ),
    );
  }
}
