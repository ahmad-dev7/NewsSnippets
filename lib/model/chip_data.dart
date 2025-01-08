import 'package:news_snippets/model/news_data.dart';

class ChipData {
  /// To identify chip topic
  String? key;
  Data? data;

  ChipData({this.key, this.data});

  ChipData.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }
}

class Data {
  int? totalPage, pageNum;
  List<NewsList>? newsList;

  Data({
    this.totalPage,
    this.pageNum,
    this.newsList,
  });

  Data.fromJson(Map<String, dynamic> json) {
    totalPage = json['total_page'] as int;
    pageNum = json['page_num'] as int;
    newsList = (json['news_list'] as List?)?.map((dynamic e) => NewsList.fromJson(e as Map<String, dynamic>)).toList();
  }
}

var dummyChipData = ChipData(
  data: Data(
    totalPage: 10,
    pageNum: 1,
    newsList: [
      NewsList(
        newsData: NewsData(
          categoryNames: ['dummy'],
          content: 'This is the dummy description of the news',
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png',
          title: 'This is the dummy title of the news for skeleton effect',
          sourceName: 'Ahmad Ali',
          sourceUrl: 'about:blank',
          relevancyTags: ['dummy'],
        ),
      ),
    ],
  ),
);
