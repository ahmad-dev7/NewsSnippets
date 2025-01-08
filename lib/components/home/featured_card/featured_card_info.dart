import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_snippets/components/my_shimmer.dart';
import 'package:news_snippets/components/read_button.dart';
import 'package:news_snippets/components/home/featured_card/title_card.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:news_snippets/pages/image_viewer.dart';

class FeaturedCardInfo extends StatelessWidget {
  final NewsData newsData;
  const FeaturedCardInfo({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Image Slider
        InkWell(
          onTap: () => context.pushTransparentRoute(
            ImageViewer(newsData.imageUrl!),
          ),
          child: Hero(
            tag: '${newsData.imageUrl!}as image tag',
            child: Card(
              color: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 10,
              shadowColor: Theme.of(context).shadowColor.withOpacity(.7),
              child: Container(
                height: 220,
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    cacheKey: newsData.imageUrl,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    placeholder: (_, __) => const MyShimmer(),
                    errorWidget: (_, __, er) => const Icon(Icons.error),
                    imageUrl: newsData.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        //* Title Card
        TitleCard(title: newsData.title!),
        //* Read More
        Positioned(
          bottom: 26,
          right: 26,
          child: ReadButton(alignment: Alignment.bottomRight, newsData: newsData),
        ),
      ],
    );
  }
}
