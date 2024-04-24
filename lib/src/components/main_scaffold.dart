import 'package:your_app_test/src/app/app_export.dart';

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
    this.preferredSizeAppBar = kToolbarHeight * 1.4,
    this.floatingActionButton,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      
      children: [
        Image.asset('assets/images/bg_image.png',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        )
        
,        Scaffold(
          
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: Colors.transparent,
          appBar: appBar != null
              ? PreferredSize(
                  preferredSize:
                      Size.fromHeight(preferredSizeAppBar ?? kToolbarHeight + 1),
                  child: appBar!)
              : null,
          body: body,
        ),
   
      ],
    );
  }
}
