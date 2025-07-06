import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaipanResultScreen extends StatefulWidget {
  final String htmlContent;

  const PaipanResultScreen({super.key, required this.htmlContent});

  @override
  State<PaipanResultScreen> createState() => _PaipanResultScreenState();
}

class _PaipanResultScreenState extends State<PaipanResultScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000)) // 设置背景透明
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            // 页面加载完成后，执行JS隐藏不需要的元素
            _controller.runJavaScript("document.querySelector('.txt_box').style.display = 'none';");
          },
        ),
      )
      ..loadHtmlString(widget.htmlContent, baseUrl: 'file:///android_asset/flutter_assets/assets/paipan/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('排盘结果'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}