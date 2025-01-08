import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/home/featured_card/featured_card_info.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FeaturedCard extends StatelessWidget {
  final List<NewsList> newsList;

  const FeaturedCard({
    super.key,
    required this.newsList,
  });

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    return Obx(
      () => VisibilityDetector(
        key: const Key('Top Stories'),
        onVisibilityChanged: (info) => info.visibleFraction > 0
            ? ctrl.autoPlayFeaturedCard.value = true
            : ctrl.autoPlayFeaturedCard.value = false,
        child: CarouselSlider.builder(
          key: Key(newsList[0].newsData!.title!),
          itemCount: newsList.length,
          carouselController: CarouselSliderController(),
          itemBuilder: (context, index, realIndex) => RepaintBoundary(
            child: FeaturedCardInfo(newsData: newsList[index].newsData!),
          ),
          options: CarouselOptions(
            height: 295,
            autoPlay: ctrl.autoPlayFeaturedCard.value,
            viewportFraction: 0.98,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (_, reason) => ctrl.activeFeaturedCard.value = _,
            initialPage: ctrl.activeFeaturedCard.value,
            autoPlayInterval: const Duration(seconds: 10),
          ),
        ),
      ),
    );
  }
}
