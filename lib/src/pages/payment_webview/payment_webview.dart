import 'dart:collection';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class PaymentWebViewScreen extends StatefulWidget {
  final String uri;

  const PaymentWebViewScreen({Key? key, required this.uri}) : super(key: key);

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  // ignore: deprecated_member_use
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    // ignore: deprecated_member_use
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    // ignore: deprecated_member_use
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    // ignore: deprecated_member_use
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  late PullToRefreshController pullToRefreshController;
  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  String? splitUrl;
  String? decodeData;

  Future<NavigationActionPolicy?> shouldOverrideUrl(
    InAppWebViewController inAppWebViewController,
    NavigationAction navigationAction,
  ) async {
    try {
      // decodeData =
      //     '${navigationAction.request.url.toString().split('?d=').last}';
      final url = navigationAction.request.url.toString();
      Navigator.pop(context);

      if (url.contains('success')) {
        AlertDialogComponent.showDialogComponent(
            alertDialog: const AlertDialog(
                insetPadding: EdgeInsets.all(16),
                contentPadding: EdgeInsets.zero,
                content: SuccessDialog(
                  isInsured: false,
                )),
            context: context);
      } else {
        AlertDialogComponent.showDialogComponent(
            alertDialog: const AlertDialog(
                insetPadding: EdgeInsets.all(16),
                contentPadding: EdgeInsets.zero,
                content: FailedDialog()),
            context: context);
      }
    } catch (e) {
      context.router.pop();
      ToastComponent3(context).showToast(context, e.toString());
    }

    return NavigationActionPolicy.ALLOW;
  }

  @override
  void initState() {
    contextMenu = ContextMenu(
      menuItems: [
        ContextMenuItem(
          // ignore: deprecated_member_use
          androidId: 1,
          id: 1,
          title: "Special",
          action: () async {
            await webViewController?.clearFocus();
          },
        )
      ],
      settings: ContextMenuSettings(
        hideDefaultSystemContextMenuItems: false,
        // menuItems: ContextMenuItems.DEFAULT,
        // show: true,
      ),
      // options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
      onCreateContextMenu: (hitTestResult) async {},
      onHideContextMenu: () {},
      onContextMenuActionItemClicked: (contextMenuItemClicked) async {},
    );

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
        color: Colors.blue,
      ),
      // options: PullToRefreshOptions(
      //   color: Colors.blue,
      // ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
            urlRequest: URLRequest(url: await webViewController?.getUrl()),
          );
        }
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: InAppWebView(
        key: webViewKey,
        shouldOverrideUrlLoading: shouldOverrideUrl,
        initialUrlRequest: URLRequest(
          url: WebUri(widget.uri),
        ),
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        // ignore: deprecated_member_use
        initialOptions: options,
      ),
    );
  }
}
