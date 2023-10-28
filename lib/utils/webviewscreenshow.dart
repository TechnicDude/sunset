import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreensShow extends StatefulWidget {
  final String url;
  const WebViewScreensShow({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreensShow> createState() => _WebViewScreensShowState();
}

class _WebViewScreensShowState extends State<WebViewScreensShow> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            const Center(
              child: LoaderScreennew(),
            ),
        ],
      ),
    );
  }
}
