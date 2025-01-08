import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_snippets/end_points.dart';
import 'package:news_snippets/model/search_data.dart';
import 'package:news_snippets/model/search_hints.dart';

class SearchDataController extends GetxController {
  var hints = <String>[].obs;
  RxList<SuggestedNews> searchData = <SuggestedNews>[].obs;
  var textController = TextEditingController().obs;
  var showClearTextIcon = false.obs;
  var searchTerm = ''.obs;

  Future<RxList<String>> getSuggestion(String text) async {
    try {
      final response = await http.get(Uri.parse('${API.searchHint}$text'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        var data = SearchHints.fromJson(jsonData);
        hints.clear();
        for (var hint in data.suggestedEntities!) {
          Get.printInfo(info: "adding ${hint.text}");
          hints.add(hint.text!);
        }
        hints.removeAt(0);
      } else {
        debugPrint("Error");
      }
    } catch (e) {
      throw "The exception for search hint is: $e";
    }

    return hints;
  }

  void searchTopic(String text) async {
    searchTerm.value = text;
    try {
      final response = await http.get(Uri.parse('${API.search}$text'), headers: {
        'X-DEVICE-ID': '786',
      });
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        var data = SearchData.fromJson(jsonData);
        searchData.value = data.suggestedNews!;
        Get.printInfo(info: "Completed search");
      } else {
        Get.printError(info: "Thik kr le bhai");
      }
    } catch (e) {
      print("Error is: $e");
    }
  }
}
