import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/end_points.dart';
import 'package:http/http.dart' as http;
// import 'package:news_snippets/model/news_data.dart';
import 'package:news_snippets/model/top_stories.dart';
import 'package:news_snippets/model/trending_news.dart';

class DataController extends GetxController {
  var isFeaturedCardLoaded = false.obs;
  var isTrendingNewsLoaded = false.obs;
  var isDataLoaded = false.obs;
  var topStories = dummyTopStories.obs;
  var trendingNews = dummyTrendingNews.obs;

  @override
  void onInit() {
    getTopStories();
    isFeaturedCardLoaded.listen((_) => isLoading());
    isTrendingNewsLoaded.listen((_) => isLoading());
    super.onInit();
  }

  void getTopStories() async {
    isFeaturedCardLoaded.value = false;
    var url = Uri.parse(API.topStories);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      topStories.value = TopStories.fromJson(jsonDecode(response.body));
      isFeaturedCardLoaded.value = true;
      getTrendingNews();
    } else {
      debugPrint('Failed to load data');
    }
  }

  void getTrendingNews() async {
    isTrendingNewsLoaded.value = false;
    var url = Uri.parse(API.trendingNews);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      trendingNews.value = TrendingNews.fromJson(jsonDecode(response.body));
      await Future.delayed(Durations.extralong1);
      removeRepeatedNews();
    } else {
      debugPrint('Failed to load data');
    }
  }

  void isLoading() {
    isDataLoaded.value =
        isFeaturedCardLoaded.value && isTrendingNewsLoaded.value;
  }

  void removeRepeatedNews() {
    if (isFeaturedCardLoaded.value) {
      trendingNews.value.data!.newsList!.removeWhere(
        (trendStory) => topStories.value.data!.newsList!.any(
          (topStory) => topStory.hashId! == trendStory.hashId!,
        ),
      );
      isTrendingNewsLoaded.value = true;
    } else {
      removeRepeatedNews();
    }
  }

  // void loadMore(List<NewsList> newsList, String endPoint) async {
  //   var response = await http.get(Uri.parse(endPoint));
  //   if (response.statusCode == 200) {
  //     var data = TopStories.fromJson(jsonDecode(response.body));
  //     newsList.addAll(data.data!.newsList!);
  //   }
  // }
}
