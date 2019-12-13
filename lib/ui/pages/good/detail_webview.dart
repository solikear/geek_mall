import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  _loadHtmlFromAssets() async {
    // String fileText = await rootBundle.loadString('assets/test.html');
    String fileText = """<p><span class="md-image md-img-loaded md-expand" style="box-sizing: border-box; min-width: 10px; min-height: 10px;
        position: relative; word-break: break-all; font-family: monospace; vertical-align: top; color: rgb(51, 51, 51);
        orphans: 4; white-space: pre-wrap; background-color: rgb(255, 255, 255);"><img
            src="https://img.alicdn.com/imgextra/i4/1714128138/O1CN018f4DO629zFkE1qyVj_!!1714128138.jpg"/> </span>
            <span class="md-image md-img-loaded\" style="box-sizing: border-box; min-width: 10px; min-height: 10px;
            position: relative; word-break: break-all; font-family: monospace; vertical-align: top; color: rgb(51, 51,
            51); orphans: 4; white-space: pre-wrap; background-color: rgb(255, 255, 255);"><img
            src="https://img.alicdn.com/imgextra/i2/1714128138/O1CN01jHJe0n29zFkOtl7zA_!!1714128138.jpg"/> </span>
            </p>""";
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    // _loadHtmlFromAssets();
    return WebView(
      initialUrl: "about",
      onWebViewCreated: (WebViewController webViewController) async{
        _controller = webViewController;
        await _loadHtmlFromAssets();
      },
    );
  }
}
