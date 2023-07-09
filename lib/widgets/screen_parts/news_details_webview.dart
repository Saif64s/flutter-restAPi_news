import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/utils.dart';

class NewsDetailsWebView extends StatefulWidget {
  const NewsDetailsWebView({Key? key, required this.link}) : super(key: key);
  final String link;

  @override
  State<NewsDetailsWebView> createState() => _NewsDetailsWebViewState();
}

class _NewsDetailsWebViewState extends State<NewsDetailsWebView> {
  late WebViewController _webViewController;
  double _progress = 0.0;
  // final _url =
  //    widget.link;
  @override
  Widget build(BuildContext context) {
    final Color color = Util(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          // stay inside
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "URL",
            style: TextStyle(color: color),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _showModalSheetFct();
              },
              icon: const Icon(
                Icons.more_horiz,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(
              child: WebView(
                initialUrl: widget.link,
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalSheetFct() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'More option',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                  onTap: () async {
                    try {
                      Share.share('Url');
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.open_in_browser),
                  title: const Text('Open in browser'),
                  onTap: () async {
                    try {
                      if (!await launchUrl(Uri.parse(widget.link))) {
                        throw Exception('Could not launch $widget.link');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.refresh),
                  title: const Text('Refresh'),
                  onTap: () async {
                    try {
                      _webViewController.reload();
                    } catch (e) {
                      print('Error: $e');
                    } finally {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
