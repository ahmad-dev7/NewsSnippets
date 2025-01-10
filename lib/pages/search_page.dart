import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/home/news_tile/news_tile.dart';
import 'package:news_snippets/components/home/section_divider.dart';
import 'package:news_snippets/controller/data_controller.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/controller/search_data_controller.dart';
import 'package:news_snippets/search_page_components.dart/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    var trendingNews = Get.find<DataController>().trendingNews.value.data!.newsList!;
    var searchCtrl = Get.find<SearchDataController>();
    return Scaffold(
      body: CustomScrollView(
        controller: ctrl.scrollController.value,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //* SearchBar
          SliverAppBar.medium(
              floating: true,
              pinned: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 50,
              scrolledUnderElevation: 0,
              flexibleSpace: const MySearchBar()),

          // const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
              child: Obx(
                () => SectionDivider(
                  title: searchCtrl.searchData.isEmpty ? 'Trending' : searchCtrl.searchTerm.value.capitalize,
                  icon: Icons.explore_outlined,
                ),
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => NewsTile(
                  newsData: searchCtrl.searchData.isEmpty
                      ? trendingNews[index].newsData!
                      : searchCtrl.searchData[index].newsData!,
                ),
                childCount: searchCtrl.searchData.isEmpty ? trendingNews.length - 1 : searchCtrl.searchData.length - 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
