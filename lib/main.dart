import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'alert_flutter.dart';
import 'alert_javascript.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter javascript on webview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                if (_webViewController != null) {
                  AlertJavascript(_webViewController!).alert();
                }
              },
              child: const Text(
                'Javascriptのアラートを表示',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: InAppWebView(
              initialFile: 'assets/www/alert.html',
              onWebViewCreated: (InAppWebViewController webViewController) {
                _webViewController = webViewController;
                // Javascriptからの処理を登録
                webViewController.addJavaScriptHandler(
                    handlerName: 'showAlert', callback: _showAlert);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// アラートを表示（Flutter）
  void _showAlert(List<dynamic> args) {
    AlertFlutter().alert(context);
  }
}
