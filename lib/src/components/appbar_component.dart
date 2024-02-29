import 'package:new_beginnings/src/app/app_export.dart';

class AppBarcomponent extends StatelessWidget {
  final bool isGradient;
  final bool isBackAppBar;
  final String title;
  final bool isTitleTowLines;
  final Widget? actionTextButton;
  final Color? appBarColor;
  final double elevation;
  final List<BoxShadow>? appBarShadoow;

  const AppBarcomponent(
      {super.key,
      required this.isGradient,
      required this.title,
      required this.isBackAppBar,
      required this.isTitleTowLines,
      this.actionTextButton,
      this.appBarColor,
      this.elevation = 0,
      this.appBarShadoow});

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
        builder: (context, state) => Container(
          decoration: BoxDecoration(boxShadow: appBarShadoow),
          child: AppBar(
              elevation: elevation,
              centerTitle: isBackAppBar,
              actions: !isBackAppBar
                  ? [
                      InkWell(
                        onTap: () => context.router
                            .pushNamed(RouteConstants.notificationRoute),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, right: 3),
                              child: Image.asset(
                                AssetsConstants.notificationAppBarIcon,
                                color: !getThemeStateIsLight()
                                    ? (darken(getThemeColor(context), 0.35))
                                    : null,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: getThemeColor(context)),
                                  color: ColorConstants.green),
                            ),
                          ]),
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
              backgroundColor: getThemeStateIsLight()
                  ? isGradient
                      ? Colors.transparent
                      : appBarColor ?? Theme.of(context).scaffoldBackgroundColor
                  : appBarColor ?? Theme.of(context).scaffoldBackgroundColor,
              leading: isBackAppBar
                  ? GestureDetector(
                      onTap: () => NavigationUtil.pop(context),
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstants.white),
                          child: const Icon(
                            Icons.arrow_back,
                            color: ColorConstants.black,
                          )),
                    )
                  : const DrawerLeadingComponent(),
              title: !isTitleTowLines
                  ? SizedBox(
                      // width: MediaQuery.of(context).size.width / 1,
                      child: Text(
                        title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const HomeTitleComponent()),
        ),
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
                fontFamily: FontConstantc.gilroyMedium),
          )
        ],
      ),
    );
  }
}
