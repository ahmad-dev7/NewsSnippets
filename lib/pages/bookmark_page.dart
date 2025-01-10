import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/home/news_tile/news_tile.dart';
import 'package:news_snippets/components/home/section_divider.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/controller/saved_data_controller.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    var savedCtrl = Get.find<SavedDataController>();
    return Scaffold(
      body: CustomScrollView(
        controller: ctrl.scrollController.value,
        slivers: [
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: SectionDivider(icon: Icons.bookmark_added_outlined, title: "Bookmarks"),
          )),
          SliverToBoxAdapter(
            child: Obx(
              () => Visibility(
                visible: savedCtrl.savedNewsData.isEmpty,
                child: Container(
                  height: context.height / 1.5,
                  width: context.width,
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_outline, size: 50),
                      MyText("No Bookmarks available"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverAnimatedList(
            key: ctrl.listKey,
            initialItemCount: savedCtrl.savedNewsData.length,
            itemBuilder: (context, index, animation) {
              // Prevent accessing out-of-bounds indices during rebuilds
              if (index >= savedCtrl.savedNewsData.length) return const SizedBox();
              return SizeTransition(
                sizeFactor: animation,
                child: Obx(
                  () {
                    // Safely access the item
                    if (index < savedCtrl.savedNewsData.length) {
                      return NewsTile(newsData: savedCtrl.savedNewsData[index]);
                    } else {
                      return const SizedBox(); // Fallback in case of invalid access
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
