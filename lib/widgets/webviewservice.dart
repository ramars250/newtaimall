import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewService extends StatelessWidget {
  final String link;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewService({this.link});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: link,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
