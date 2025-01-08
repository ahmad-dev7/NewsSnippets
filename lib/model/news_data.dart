class NewsList {
  NewsData? newsData;
  String? hashId;

  NewsList({
    this.newsData,
  });

  NewsList.fromJson(Map<String, dynamic> json) {
    hashId = json['hash_id'];
    newsData = NewsData.fromJson(json['news_obj']);
  }
}

class NewsData {
  String? authorName;
  String? content;
  String? sourceUrl;
  String? sourceName;
  String? title;
  String? imageUrl;
  int? createdAt;
  List<String>? categoryNames;
  List<String>? relevancyTags;
  List<String>? hashTags;
  String? bottomHeadline;
  String? bottomText;
  String? bottomPanelLink;
  String? positionStartTime;
  String? positionExpireTime;
  String? dfpTags;
  bool? isSimilarFeedAvailable;

  NewsData({
    this.authorName,
    this.content,
    this.sourceUrl,
    this.sourceName,
    this.title,
    this.imageUrl,
    this.createdAt,
    this.categoryNames,
    this.relevancyTags,
    this.hashTags,
    this.bottomHeadline,
    this.bottomText,
    this.bottomPanelLink,
    this.positionStartTime,
    this.positionExpireTime,
    this.dfpTags,
    this.isSimilarFeedAvailable,
  });

  NewsData.fromJson(Map<String, dynamic> json) {
    authorName = json['author_name'] as String?;
    content = json['content'] as String?;
    sourceUrl = json['source_url'] as String?;
    sourceName = json['source_name'] as String?;
    title = json['title'] as String?;
    imageUrl = json['image_url'] as String?;
    createdAt = json['created_at'] as int?;
    categoryNames = (json['category_names'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    relevancyTags = (json['relevancy_tags'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    bottomHeadline = json['bottom_headline'] as String?;
    bottomText = json['bottom_text'] as String?;
    bottomPanelLink = json['bottom_panel_link'] as String?;
    positionStartTime = json['position_start_time'] as String?;
    positionExpireTime = json['position_expire_time'] as String?;
    dfpTags = json['dfp_tags'] as String?;
    isSimilarFeedAvailable = json['is_similar_feed_available'] as bool?;
  }
}
