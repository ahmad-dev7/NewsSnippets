import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/animation_controller.dart';
import 'package:news_snippets/controller/chip_data_controller.dart';
import 'package:news_snippets/controller/data_controller.dart';
import 'package:news_snippets/controller/saved_data_controller.dart';
import 'package:news_snippets/controller/search_data_controller.dart';
import 'package:news_snippets/pages/bookmark_page.dart';
import 'package:news_snippets/pages/home_page.dart';
import 'package:news_snippets/pages/search_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyController extends GetxController {
  var pages = const <Widget>[HomePage(), SearchPage(), BookmarkPage()];
  var inactiveIcons = [Icons.newspaper_outlined, Icons.search_outlined, Icons.bookmark_outline];
  var activeIcons = [Icons.newspaper, Icons.search_rounded, Icons.bookmark];
  var labels = ['Home', 'Search', 'Bookmark'];
  var scrollController = ScrollController().obs;
  var pageController = PageController().obs;
  var isScrollToHideShown = true.obs;
  var scrollPosition = 0.0.obs;
  var activeIndex = 0.obs;
  var isDark = true.obs;
  var selectedChip = 0.obs;
  var showTopButton = false.obs;
  var autoPlayFeaturedCard = true.obs;
  var webViewController = WebViewController().obs;
  var isWebViewReady = false.obs;
  var webViewProgress = 1.obs;
  var activeFeaturedCard = 0.obs;
  var activeTrendingCard = 0.obs;
  var isImageViewerDismissed = true.obs;
  var activeChipTopic = 3.obs;
  var listKey = GlobalKey<SliverAnimatedListState>();

  @override
  void onInit() {
    Get.lazyPut(() => DataController(), fenix: true);
    Get.lazyPut(() => MyAnimationController(), fenix: true);
    Get.lazyPut(() => ChipDataController(), fenix: true);
    Get.lazyPut(() => SearchDataController(), fenix: true);
    Get.lazyPut(() => SavedDataController(), fenix: true);
    addScrollListener();
    showTopButton.listen((bool _) => animateGoToTopButton(_));
    super.onInit();
  }

  @override
  void onClose() {
    isWebViewReady.value = false;
    webViewProgress.value = 1;
    webViewController.value.clearLocalStorage();
    super.onClose();
  }

  void addScrollListener() {
    scrollController.value.addListener(() {
      showTopButton.value = scrollController.value.position.pixels > Get.size.height;

      if (scrollController.value.hasClients) {
        scrollPosition.value = scrollController.value.position.pixels;
      }

      final direction = scrollController.value.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isScrollToHideShown.value = true;
      } else if (direction == ScrollDirection.reverse) {
        isScrollToHideShown.value = false;
      }
    });
  }

  void animateGoToTopButton(bool _) {
    if (_) {
      Get.find<MyAnimationController>().animationController.reset();
      Get.find<MyAnimationController>().animationController.forward();
    } else {
      Get.find<MyAnimationController>().animationController.reverse();
    }
  }

  void goToTop() {
    var duration = Durations.extralong4;
    var curve = Curves.fastEaseInToSlowEaseOut;
    scrollController.value.animateTo(0, duration: duration, curve: curve);
    isScrollToHideShown.value = true;
    scrollPosition.value = 0.0;
  }
}
