import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/controller/search_data_controller.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var searchDataCtrl = Get.find<SearchDataController>();
    var textController = TextEditingController();
    var focus = FocusNode();
    void onSearchTopic(String text) {
      textController.text = text;
      focus.unfocus();
      searchDataCtrl.searchTopic(text);
      Get.printInfo(info: "called search function");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TypeAheadField(
        controller: textController,
        hideKeyboardOnDrag: true,
        hideOnEmpty: true,
        focusNode: focus,
        builder: (context, controller, focusNode) => TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (value) {
            if (textController.value.text.isNotEmpty) {
              Get.find<SearchDataController>().showClearTextIcon.value = true;
            } else {
              Get.find<SearchDataController>().showClearTextIcon.value = false;
            }
          },
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            suffixIcon: Obx(
              () => Visibility(
                visible: Get.find<SearchDataController>().showClearTextIcon.value,
                child: IconButton(
                  onPressed: () {
                    textController.clear();
                    Get.find<SearchDataController>().searchData.clear();
                    Get.find<SearchDataController>().showClearTextIcon.value = false;
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            hintText: 'Search any topic',
            hintStyle: const TextStyle(fontWeight: FontWeight.w300),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(.02),
            filled: true,
          ),
        ),
        itemBuilder: (context, _) => InkWell(
          onTap: () => onSearchTopic(_),
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: MyText(_),
              ),
              contentPadding: const EdgeInsets.all(0),
              subtitle: const Opacity(opacity: .05, child: Divider()),
            ),
          ),
        ),
        // On selected is not working, instead inkwell is applied on items in itemBuilder itself
        onSelected: (value) => print("Selected"),
        suggestionsCallback: (search) async {
          return await searchDataCtrl.getSuggestion(search);
        },
      ),
    );
  }
}
