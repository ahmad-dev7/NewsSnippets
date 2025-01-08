import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SourcePage extends StatelessWidget {
  final String title;
  final String url;
  const SourcePage({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(MyController());
    ctrl.onDelete();
    ctrl.webViewController.value
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            if (ctrl.webViewProgress.value == 100) {
              Get.snackbar(
                '',
                '',
                titleText: MyText(
                  'Open !?',
                  color: Theme.of(context).colorScheme.onPrimary,
                  weight: FontWeight.bold,
                ),
                messageText: MyText(
                  'It\'ll open default App/Browser.',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                duration: const Duration(seconds: 5),
                backgroundColor: Theme.of(context).canvasColor,
                dismissDirection: DismissDirection.horizontal,
                mainButton: TextButton.icon(
                  style: ButtonStyle(
                    enableFeedback: true,
                    elevation: const MaterialStatePropertyAll(10),
                    backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: () => launchUrlString(request.url),
                  icon: const Icon(Icons.open_in_new, color: Colors.white),
                  label: const MyText('Open', color: Colors.white),
                ),
              );

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageFinished: (url) => ctrl.isWebViewReady.value = true,
          onProgress: (progress) => ctrl.webViewProgress.value = progress,
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: Chip(
          label: Text(title),
          avatar: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          backgroundColor: Theme.of(context).dividerColor.withOpacity(.15),
          side: BorderSide.none,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 3),
          child: Obx(
            () => LinearProgressBar(
              maxSteps: 100,
              currentStep: ctrl.webViewProgress.value,
              progressColor: Theme.of(context).colorScheme.secondary.withOpacity(.5),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
            ctrl.isWebViewReady.value = false;
          },
          icon: Icon(
            Icons.close,
            size: 35,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Obx(() => !ctrl.isWebViewReady.value
          ? SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Shimmer.fromColors(
                baseColor: const Color(0x7E404040),
                highlightColor: const Color(0xD6A6A6A6).withOpacity(.3),
                child: Card.filled(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            )
          : WebViewWidget(controller: ctrl.webViewController.value)),
    );
  }
}
