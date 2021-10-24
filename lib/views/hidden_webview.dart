import 'package:flutter/cupertino.dart';
import 'package:kmart_app/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HiddenWebview extends Visibility {
  HiddenWebview(Function(String) onLoad, {Key? key})
      : super(
            key: key,
            visible: false,
            maintainState: false,
            child: WebView(
              initialUrl: BASE_URL,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: onLoad,
            ));
}
