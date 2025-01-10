import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/home/news_tile/news_tile.dart';
import 'package:news_snippets/components/my_button.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/components/read_button.dart';
import 'package:news_snippets/components/source_button.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/controller/saved_data_controller.dart';
import 'package:news_snippets/model/news_data.dart';

class NewsTileInfo extends StatelessWidget {
  final NewsData newsData;
  final double maxWidth;
  const NewsTileInfo({
    super.key,
    required this.newsData,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //* title
        Flexible(
          child: Hero(
            tag: '${newsData.title!}as title tag',
            child: Material(
              color: Colors.transparent,
              child: MyText(
                newsData.title!,
                size: 15.5,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: [
            //* category
            OverflowBox(
              fit: OverflowBoxFit.deferToChild,
              maxWidth: (maxWidth * 0.6) * .5,
              child: Hero(
                tag: '${newsData.title!}as category tag',
                child: Material(
                  color: Colors.transparent,
                  child: MyButton(
                    text: MyText(
                      newsData.categoryNames!.isNotEmpty ? newsData.categoryNames![0] : 'Random',
                      size: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            //* Read Button
            ReadButton(newsData: newsData),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //* Source
            Expanded(
              flex: 2,
              child: Hero(
                tag: '${newsData.title!}as source tag',
                child: Material(
                  color: Colors.transparent,
                  child: SourceButton(
                    sourceName: newsData.sourceName!,
                    sourceUrl: newsData.sourceUrl!,
                  ),
                ),
              ),
            ),
            //* Save button
            Expanded(
              child: SizedBox(
                width: 40,
                child: Obx(
                  () {
                    var savedDataCtrl = Get.find<SavedDataController>();
                    var isSaved = savedDataCtrl.savedNewsData.contains(newsData);
                    return IconButton(
                      onPressed: () {
                        var savedDataCtrl = Get.find<SavedDataController>();
                        var ctrl = Get.find<MyController>();

                        if (savedDataCtrl.savedNewsData.contains(newsData)) {
                          var index = savedDataCtrl.savedNewsData.indexOf(newsData);
                          if (ctrl.activeIndex.value == 2) {
                            removeItemWithAnimation(index, savedDataCtrl, ctrl);
                          } else {
                            debugPrint("Came here");
                            savedDataCtrl.savedNewsData.removeAt(index);
                          }
                        } else {
                          // Add the item
                          savedDataCtrl.savedNewsData.add(newsData);
                        }
                      },
                      icon: Icon(isSaved ? Icons.bookmark_added : Icons.bookmark_add_outlined),
                      padding: const EdgeInsets.all(10),
                    );
                  },
                ),
              ),
            ),
            // const Expanded(
            //   child: Icon(Icons.bookmark_outline_outlined),
            // ),
          ],
        )
      ],
    );
  }
}

void removeItemWithAnimation(int index, SavedDataController savedCtrl, MyController ctrl) {
  debugPrint("triggered removeWithAnimation");

  // Save the data to be removed for animation
  var removeData = savedCtrl.savedNewsData[index];
  savedCtrl.savedNewsData.removeAt(index); // Use removeAt to ensure index consistency

  // Trigger the animation for removal
  ctrl.listKey.currentState?.removeItem(
    index,
    (context, animation) {
      return Stack(
        children: [
          // SizeTransition for the list item animation
          SizeTransition(
            sizeFactor: animation,
            child: const SizedBox.shrink(), // Placeholder for size animation
          ),

          // FadeOutLeft animation for the removing item
          NewsTile(newsData: removeData)
              .animate()
              .fadeOut(duration: Durations.medium1) // Fade effect
              .moveX(begin: 0, end: -context.width), // Left slide effect
        ],
      );
    },
    duration: Durations.medium4, // Match the animation duration
  );

  debugPrint("animated removal");
}
