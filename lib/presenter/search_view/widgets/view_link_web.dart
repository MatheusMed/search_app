import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewLinkWeb extends StatefulWidget {
  final String link;
  const ViewLinkWeb({Key? key, required this.link}) : super(key: key);

  @override
  State<ViewLinkWeb> createState() => _ViewLinkWebState();
}

class _ViewLinkWebState extends State<ViewLinkWeb> {
  late final WebViewController _controller;
  int progressLoading = 0;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          setState(() {});
          progressLoading = progress;
        },
      ))
      ..loadRequest(Uri.parse(widget.link));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: progressLoading == 100
          ? WebViewWidget(controller: _controller)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
