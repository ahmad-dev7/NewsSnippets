class API {
  /// This is the base url of the api
  static const String baseUrl = "https://inshorts.com/api/en/";

  /// This contains the base information which is required [ limit, card data ]
  static const String info = "&max_limit=30&include_card_data=true";

  /// This provides the top news stories
  static const String topStories = "${baseUrl}news?category=top_stories$info";

  /// This provides the trending news from the world
  static const String trendingNews = "${baseUrl}news?category=trending$info";

  /// This provides the news data for the searched term, [append page number] as [page=number]
  static const String topic = "${baseUrl}search/trending_topics/";

  /// Search end point
  ///* header [X-DEVICE-ID: 864629047372819]

  static const String search = 'https://news-search.newsinshorts.com/en/v3/news_search/?query_str=';

  /// search query hints, append user typed text
  ///* header [X-DEVICE-ID: 864629047372819]
  static const String searchHint = 'https://news-search.newsinshorts.com/en/v3/auto_suggest?query_str=';
}
