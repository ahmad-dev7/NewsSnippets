import 'package:news_snippets/model/news_data.dart';

class TrendingNews {
  Data? data;

  TrendingNews({this.data});

  TrendingNews.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  List<NewsList>? newsList;

  Data({
    this.newsList,
  });

  Data.fromJson(Map<String, dynamic> json) {
    newsList = (json['news_list'] as List?)
        ?.map((dynamic e) => NewsList.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

var dummyTrendingNews = TrendingNews(
  data: Data(
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
