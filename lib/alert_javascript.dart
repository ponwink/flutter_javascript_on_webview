import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AlertJavascript {
  AlertJavascript(this.webViewController);

  final InAppWebViewController webViewController;

  /// アラートを表示
  void alert() {
    webViewController.evaluateJavascript(
        source: 'alert("Hello, javascript!");');
  }
}
