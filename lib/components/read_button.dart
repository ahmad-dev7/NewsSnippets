import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/custom_cupertino.dart';
import 'package:news_snippets/controller/data_controller.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:news_snippets/pages/read_details_page.dart';

class ReadButton extends StatelessWidget {
  final Alignment? alignment;
  final NewsData newsData;
  const ReadButton({super.key, this.alignment, required this.newsData});

  @override
  Widget build(BuildContext context) {
    goToReadPage() {
      Navigator.push(
        context,
        CustomCupertinoPageRoute(
          builder: (context) => ReadDetails(newsData: newsData),
          duration: Durations.extralong4,
        ),
      );
    }

    return Align(
      alignment: alignment ?? Alignment.center,
      child: Obx(
        () => InkWell(
          onTap: Get.find<DataController>().isDataLoaded.value ? goToReadPage : null,
          splashColor: Colors.transparent,
          child: Chip(
            elevation: 10,
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            deleteButtonTooltipMessage: 'Read',
            visualDensity: VisualDensity.compact,
            surfaceTintColor: Colors.transparent,
            side: BorderSide.none,
            //onDeleted: Get.find<DataController>().isDataLoaded.value ? goToReadPage : () {},
            backgroundColor: Theme.of(context).primaryColor,
            //deleteIcon: const Icon(Icons.read_more_rounded, color: Colors.white),
            //label: const MyText('...', weight: FontWeight.w500, color: Colors.white),
            label: const Icon(Icons.read_more, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
