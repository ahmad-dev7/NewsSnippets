import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/end_points.dart';
import 'package:news_snippets/model/chip_data.dart';

class ChipDataController extends GetxController {
  var chipNews = dummyChipData.obs;
  var isChipDataLoaded = false.obs;
  List<Rx<ChipInfo>> chips = [
    ChipInfo(key: 'Finance', page: 1).obs,
    ChipInfo(key: 'Sports', page: 1).obs,
    ChipInfo(key: 'Politics', page: 1).obs,
    ChipInfo(key: 'World', page: 1).obs,
    ChipInfo(key: 'Entertainment', page: 1).obs,
    ChipInfo(key: 'Technology', page: 1).obs,
    ChipInfo(key: 'Science', page: 1).obs,
    ChipInfo(key: 'Crime', page: 1).obs,
  ];

  @override
  void onInit() {
    getChipData();
    super.onInit();
  }

  void getChipData() async {
    isChipDataLoaded.value = false;
    await Future.delayed(Durations.extralong1);
    var index = Get.find<MyController>().activeChipTopic.value;
    var chip = chips[index].value;
    var topic = index == 0 ? chip.key.toUpperCase() : chip.key.toLowerCase();
    var url = '${API.topic}$topic?page=${chip.page}&type=CUSTOM_CATEGORY';
    Get.printInfo(info: "url: $url");
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        chipNews.value = ChipData.fromJson(jsonDecode(response.body));
        Get.printInfo(info: response.body);
        isChipDataLoaded.value = true;
      } else {
        Get.printInfo(info: "Error: ${response.statusCode}");
      }
    } catch (e) {
      Get.printError(info: "Throwing: $e");
    }
  }

  Future<Rx<ChipData>> loadMore() async {
    print('triggered');
    var index = Get.find<MyController>().activeChipTopic.value;
    var chip = chips[index].value;
    chip.page++;
    var topic = index == 0 ? chip.key.toUpperCase() : chip.key.toLowerCase();
    var url = '${API.topic}$topic?page=${chip.page}&type=CUSTOM_CATEGORY';
    Get.printInfo(info: "url: $url");
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // ignore: await_only_futures
        var newData = await ChipData.fromJson(jsonDecode(response.body));
        Get.printInfo(info: chipNews.value.data!.newsList!.length.toString());
        chipNews.value.data!.newsList!.addAll(newData.data!.newsList!);
        Get.printInfo(info: chipNews.value.data!.newsList!.length.toString());
        await Future.delayed(Durations.extralong1 * 2);
        return chipNews;
      } else {
        Get.printInfo(info: "Error: ${response.statusCode}");
        return chipNews;
      }
    } catch (e) {
      Get.printError(info: "Failed to load more: $e");
      return chipNews;
    }
  }
}

class ChipInfo {
  String key;
  int page;
  ChipInfo({
    required this.key,
    required this.page,
  });
}
