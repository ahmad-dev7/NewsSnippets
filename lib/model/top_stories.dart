import 'package:news_snippets/model/news_data.dart';

class TopStories {
  Data? data;

  TopStories({
    this.data,
  });

  TopStories.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  String? minNewsId;
  List<NewsList>? newsList;

  Data({
    this.minNewsId,
    this.newsList,
  });

  Data.fromJson(Map<String, dynamic> json) {
    minNewsId = json['min_news_id'] as String?;
    newsList = (json['news_list'] as List?)
        ?.map((dynamic e) => NewsList.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

var dummyTopStories = TopStories(
  data: Data(
    minNewsId: 'dummy123',
    newsList: [
      NewsList(
        newsData: NewsData(
          categoryNames: ['dummy'],
          content: 'This is the dummy description of the news',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png',
          title: 'This is the dummy title of the news for skeleton effect',
          sourceName: 'Ahmad Ali',
          sourceUrl: 'about:blank',
          relevancyTags: ['dummy'],
        ),
      )
    ],
  ),
);
