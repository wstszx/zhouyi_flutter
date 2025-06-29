import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaipanResultScreen extends StatefulWidget {
  const PaipanResultScreen({super.key});

  @override
  State<PaipanResultScreen> createState() => _PaipanResultScreenState();
}

class _PaipanResultScreenState extends State<PaipanResultScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final WebViewController controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      );
    _controller = controller;
    _loadHtmlFromAssets();
  }

  _loadHtmlFromAssets() {
    _controller.loadFlutterAsset('assets/bazi_platform_files.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('排盘结果'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}