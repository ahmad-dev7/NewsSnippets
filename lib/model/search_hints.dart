class SearchHints {
  List<SuggestedEntities>? suggestedEntities;

  SearchHints({this.suggestedEntities});

  SearchHints.fromJson(Map<String, dynamic> json) {
    if (json['suggested_entities'] != null) {
      suggestedEntities = <SuggestedEntities>[];
      json['suggested_entities'].forEach((v) {
        suggestedEntities!.add(SuggestedEntities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (suggestedEntities != null) {
      data['suggested_entities'] = suggestedEntities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuggestedEntities {
  String? text;
  int? score;

  SuggestedEntities({this.text, this.score});

  SuggestedEntities.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['score'] = score;
    return data;
  }
}
