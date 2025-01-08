import 'package:flutter/material.dart';
import 'package:news_snippets/components/my_text.dart';

class TitleCard extends StatelessWidget {
  final String title;
  const TitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 175,
      left: 10,
      right: 10,
      child: SizedBox(
        height: 100,
        child: Hero(
          tag: '${title}as title tag',
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
              ),
            ),
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 8),
            shadowColor: Theme.of(context).shadowColor.withOpacity(.6),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.75),
            surfaceTintColor: Colors.transparent,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 8, 2),
              child: SizedBox(
                height: 102,
                child: MyText(
                  title,
                  size: 17.3,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  weight: FontWeight.w900,
                  shadow: [
                    Shadow(
                      offset: const Offset(2, 2),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      blurRadius: 10,
                    ),
                    Shadow(
                      offset: const Offset(-2, -2),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
