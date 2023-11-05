import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetaySayfa extends StatefulWidget{
  String haberUrl;


  DetaySayfa({required this.haberUrl});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.haberUrl));

    setState(() {
      widget.haberUrl = widget.haberUrl.contains("http:")
          ? widget.haberUrl.replaceAll("http:", "https:")
          : widget.haberUrl;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Haberin Tamamı"),backgroundColor: Colors.grey,),
      body: WebViewWidget(controller: controller,),

    );
}
}
