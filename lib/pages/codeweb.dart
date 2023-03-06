import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class MyWebView extends StatefulWidget {
  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  // var controller = WebViewController()
  var loadingPercentage =0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
      controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
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
      ))
      ..loadRequest(
        Uri.parse('https://www.programiz.com/python-programming/online-compiler/?ref=742a9ec4'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,backgroundColor: Colors.white,
          title: Text("Hello World Program",style: GoogleFonts.poppins(color: Colors.black),),
          leading: GestureDetector(onTap: () {
            Navigator.pop(context);
          },child: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,)),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
