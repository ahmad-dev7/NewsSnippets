import 'package:awesome_bookmark_icon_button/awesome_bookmark_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_snippets/components/my_button.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/components/read_button.dart';
import 'package:news_snippets/components/source_button.dart';
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
              child: BookMarkIconButton(
                onPressed: () {},
                isSaved: false,
                padding: const EdgeInsets.all(10),
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
