import 'package:loadmore/loadmore.dart';
import 'package:news_snippets/components/home/go_to_top.dart';
import 'package:news_snippets/components/home/my_sliver_appbar.dart';
import 'package:news_snippets/components/home/news_tile/news_tile.dart';
import 'package:news_snippets/controller/chip_data_controller.dart';
import 'package:news_snippets/controller/data_controller.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var dataCtrl = Get.find<DataController>();
    var chipDataCtrl = Get.find<ChipDataController>();
    var ctrl = Get.find<MyController>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ctrl.scrollController.value.removeListener(() {});
      var sc = ScrollController(initialScrollOffset: ctrl.scrollPosition.value);
      ctrl.scrollController.value = sc;
      ctrl.addScrollListener();
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: const GoToTop(),
      body: Obx(
        () {
          var topStories = dataCtrl.topStories.value.data!.newsList!;
          var trending = dataCtrl.trendingNews.value.data!.newsList!;
          var chipData = chipDataCtrl.chipNews.value.data!.newsList!;
          RxList<NewsList> news = chipData.obs;
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: !dataCtrl.isDataLoaded.value,
            child: CustomScrollView(
              controller: ctrl.scrollController.value,
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                MySliverAppBAr(trending: trending, topStories: topStories),
                LoadMore(
                  whenEmptyLoad: false,
                  textBuilder: (status) => 'Loading...',
                  onLoadMore: () async {
                    var updatedData = await chipDataCtrl.loadMore();
                    news += updatedData.value.data!.newsList!;
                    chipData += news;
                    await Future.delayed(Durations.short2);
                    return true;
                  },
                  child: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Skeletonizer(
                        enableSwitchAnimation: true,
                        enabled: !chipDataCtrl.isChipDataLoaded.value,
                        child: NewsTile(newsData: news[index].newsData!),
                      ),
                      childCount: news.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
