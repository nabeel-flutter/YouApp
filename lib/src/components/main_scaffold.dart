import 'package:new_beginnings/src/app/app_export.dart';

class MainScaffold extends StatelessWidget {
  final bool? isGradient;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final double? preferredSizeAppBar;
  final Widget? floatingActionButton;

  const MainScaffold({
    super.key,
    required this.body,
     this.isGradient,
    this.appBar,
    this.bottomNavigationBar,
    this.preferredSizeAppBar,
    this.floatingActionButton,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: getThemeStateIsLight()
          ? ColorConstants.black
          : ColorConstants.bgColorLight,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize:
                  Size.fromHeight(preferredSizeAppBar ?? kToolbarHeight),
              child: appBar!)
          : null,
      body: body,
    );
  }
}
