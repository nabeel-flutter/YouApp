import 'package:your_app_test/src/app/app_export.dart';

class AppBarcomponent extends StatelessWidget {
  final bool isGradient;
  final bool isBackAppBar;
  final String title;
  final bool isTitleTowLines;
  final Widget? actionTextButton;
  final Color? appBarColor;
  final double elevation;
  final List<BoxShadow>? appBarShadoow;

  const AppBarcomponent({
    super.key,
    required this.isGradient,
    required this.title,
    required this.isBackAppBar,
    required this.isTitleTowLines,
    this.actionTextButton,
    this.appBarColor,
    this.elevation = 0,
    this.appBarShadoow,
  });

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 1),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22)),
            image: const DecorationImage(
                image: AssetImage(AssetsConstants.appBarbgImage),
                fit: BoxFit.cover),
            // color: appBarColor ?? ColorConstants.primaryColor,
            boxShadow: appBarShadoow ?? []),
        child: AppBar(
            elevation: elevation,
            centerTitle: isBackAppBar,
            actions: !isBackAppBar
                ? [
                    InkWell(
                      onTap: () => context.router
                          .pushNamed(RouteConstants.notificationRoute),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Padding(
                          padding: EdgeInsets.only(top: 6.0, right: 3),
                          child: Icon(
                            Icons.notifications_on_outlined,
                            color: ColorConstants.white,
                          ),
                        ),
                      ),
                    ),
                  ]
                : actionTextButton != null
                    ? [actionTextButton!]
                    : [
                        Container(
                          width: 50,
                        )
                      ],
            backgroundColor: Colors.transparent,
            leadingWidth: isBackAppBar ? 56 : 150,
            leading: isBackAppBar
                ? GestureDetector(
                    onTap: () => NavigationUtil.pop(context),
                    child: Container(
                        width: 32,
                        height: 32,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorConstants.white),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 14,
                          color: Color(0xff0A7E80),
                        )),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      AssetsConstants.splashLogoImage,
                    ),
                  ),
            title: isBackAppBar
                ? SizedBox(
                    child: Text(
                      title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                : null),
      ),
    );
  }
}

class TopSheetComponent extends StatelessWidget {
  const TopSheetComponent({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: darken(getThemeColor(context), 0.35)),
            child: Image.asset(
              image,
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: ColorConstants.white,
                fontFamily: FontConstants.gilroyMedium),
          )
        ],
      ),
    );
  }
}
