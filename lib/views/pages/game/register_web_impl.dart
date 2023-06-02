import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void registerWebImplementation() {
  WebViewPlatform.instance = WebWebViewPlatform();
}
