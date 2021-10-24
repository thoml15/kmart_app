import 'package:http/http.dart' as http;
import 'package:kmart_app/constant.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class WebClient extends http.BaseClient {
  Future<String> fetchHome() async {
    final response = await get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }

  final String userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 x/537.36';

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['user-agent'] = userAgent;
    request.headers['cookie'] = await _generateCookieHeader();
    return http.Client().send(request);
  }

  Future<Map<String, String>> _setCookie() async {
    WebviewCookieManager cookieManager = WebviewCookieManager();
    Map<String, String> cookies = {};
    var webViewCookies =
        cookieManager.getCookies(BASE_URL).toString().split(',');

    for (var cookie in webViewCookies) {
      var splitCookies = cookie.split(';');

      for (var cookie in splitCookies) {
        var keyValue = cookie.toString().split('=');
        if (keyValue.length == 2) {
          var key = keyValue[0].trim();
          var value = keyValue[1];
          // ignore keys that aren't cookies
          if (key == 'path' || key == 'expires') {
            continue;
          }
          cookies[key] = value;
        }
      }
    }
    if (cookies.isEmpty) {
      return {};
    } else {
      return cookies;
    }
  }

  Future<String> _generateCookieHeader() async {
    Map<String, String> cookies = await _setCookie();
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) {
        cookie += ";";
      }
      cookie += key + "=" + cookies[key].toString();
    }
    return cookie;
  }
}
