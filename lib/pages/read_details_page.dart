import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_button.dart';
import 'package:news_snippets/components/my_floating_button.dart';
import 'package:news_snippets/components/my_shimmer.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/components/source_button.dart';
import 'package:news_snippets/model/news_data.dart';
import 'package:news_snippets/pages/image_viewer.dart';

class ReadDetails extends StatelessWidget {
  final NewsData newsData;
  const ReadDetails({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () => context.pushTransparentRoute(
                    ImageViewer(newsData.imageUrl!),
                  ),
                  child: Hero(
                    tag: '${newsData.imageUrl!}as image tag',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        height: Get.size.height / 2.5,
                        cacheKey: newsData.imageUrl!,
                        imageUrl: newsData.imageUrl!,
                        placeholder: (_, __) => const MyShimmer(),
                        errorWidget: (_, __, er) => const Icon(Icons.error),
                        width: Get.size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 8,
                  child: FloatingIconButton(
                    onTap: () => Get.back(),
                    icon: Icons.arrow_back_ios_new,
                  ).animate().slide(delay: Durations.medium4),
                ),
                Positioned(
                  top: 4,
                  right: 8,
                  child: FloatingIconButton(
                    onTap: () => 'Save',
                    icon: Icons.bookmark_outline,
                  ).animate().slide(delay: Durations.medium4),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Hero(
                    tag: '${newsData.title!}as title tag',
                    child: Material(
                      color: Colors.transparent,
                      child: MyText(
                        newsData.title!,
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Hero(
                        tag: '${newsData.title}as source tag',
                        child: Material(
                          color: Colors.transparent,
                          child: SourceButton(
                            sourceName: newsData.sourceName!,
                            sourceUrl: newsData.sourceUrl!,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Hero(
                        tag: '${newsData.title!}as category tag',
                        child: Material(
                          color: Colors.transparent,
                          child: MyButton(
                            label: newsData.categoryNames!.isNotEmpty
                                ? newsData.categoryNames![0]
                                : 'Random',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Material(
                    color: Colors.transparent,
                    child: MyText(newsData.content!, size: 17),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    children: List.generate(
                      newsData.relevancyTags!.length,
                      (index) => MyButton(
                        label: newsData.relevancyTags!.isNotEmpty
                            ? '#${newsData.relevancyTags![index]}'
                            : '',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
