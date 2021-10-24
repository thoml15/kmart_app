import 'package:flutter/material.dart';
import 'package:kmart_app/appbars/kmart_app_bar.dart';
import 'package:kmart_app/drawers/kmart_app_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart' as actualView;

import '../constant.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KmartAppBar(this.context),
      drawer: KmartAppDrawer(this.context),
      body: const actualView.WebView(
        javascriptMode: actualView.JavascriptMode.unrestricted,
        initialUrl: BASE_URL,
      ),
    );
  }
}
