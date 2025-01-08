import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_shimmer.dart';
import 'package:news_snippets/components/home/news_tile/news_tile_info.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:news_snippets/pages/image_viewer.dart';

class NewsTile extends StatelessWidget {
  final NewsData newsData;
  const NewsTile({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 35),
        width: Get.size.width,
        height: 175,
        child: LayoutBuilder(
          builder: (context, constraints) => Card(
            elevation: 20,
            shadowColor: Theme.of(context).shadowColor.withOpacity(.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
              ),
            ),
            margin: const EdgeInsets.all(0),
            color: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            child: Row(
              children: [
                InkWell(
                  onTap: () => context.pushTransparentRoute(
                    ImageViewer(newsData.imageUrl!),
                  ),
                  child: Hero(
                    tag: '${newsData.imageUrl!}as image tag',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: CachedNetworkImage(
                        cacheKey: newsData.imageUrl,
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxHeight,
                        placeholder: (_, __) => const MyShimmer(),
                        errorWidget: (_, __, er) => const Icon(Icons.error),
                        imageUrl: newsData.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: constraints.maxWidth * 0.6,
                  padding: const EdgeInsets.all(8),
                  child: NewsTileInfo(
                    maxWidth: constraints.maxWidth,
                    newsData: newsData,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
