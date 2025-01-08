import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/home/featured_card/featured_card.dart';
import 'package:news_snippets/components/home/section_divider.dart';
import 'package:news_snippets/components/my_button.dart';
import 'package:news_snippets/controller/chip_data_controller.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:wheel_slider/wheel_slider.dart';

class MySliverAppBAr extends StatelessWidget {
  final List<NewsList> trending, topStories;
  const MySliverAppBAr({super.key, required this.trending, required this.topStories});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    var chipCtrl = Get.find<ChipDataController>();
    return SliverAppBar(
      pinned: true,
      expandedHeight: 380,
      toolbarHeight: 0,
      forceElevated: true,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Obx(
            () => WheelSlider.customWidget(
              totalCount: 8,
              initValue: ctrl.activeChipTopic.value,
              perspective: 0.002,
              isInfinite: false,
              scrollPhysics: const BouncingScrollPhysics(),
              onValueChanged: (i) {
                ctrl.activeChipTopic.value = i;
                chipCtrl.getChipData();
              },
              hapticFeedbackType: HapticFeedbackType.vibrate,
              showPointer: false,
              itemSize: 130,
              horizontalListHeight: 60,
              children: List.generate(
                8,
                (_) {
                  var isActive = _ == ctrl.activeChipTopic.value;
                  return AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Durations.medium1,
                    child: MyButton(
                      label: chipCtrl.chips[_].value.key,
                      textColor: isActive ? Colors.white : Theme.of(context).primaryColor.withOpacity(.7),
                      backgroundColor: isActive ? Theme.of(context).primaryColor : Colors.transparent,
                      fontWeight: isActive ? FontWeight.bold : null,
                      padding: EdgeInsets.symmetric(
                        horizontal: isActive ? 10 : 0,
                        vertical: isActive ? 8 : 4,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        expandedTitleScale: 1,
        background: Wrap(
          children: [
            SectionDivider(title: 'Featured', onSeeAll: () {}),
            FeaturedCard(newsList: topStories),
          ],
        ),
      ),
    );
  }
}
