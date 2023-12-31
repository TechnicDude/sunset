import 'package:flutter/material.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/utils/webviewscreenshow.dart';

class WebviewWidgetUIScreen extends StatefulWidget {
  final String url;
  final String text;

  const WebviewWidgetUIScreen({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  State<WebviewWidgetUIScreen> createState() => _WebviewWidgetUIScreenState();
}

class _WebviewWidgetUIScreenState extends State<WebviewWidgetUIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarScreens(text: widget.text)),
        body: WebViewScreensShow(url: widget.url));
  }
}
