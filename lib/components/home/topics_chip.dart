import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_button.dart';
import 'package:news_snippets/controller/my_controller.dart';

class TopicsChip extends StatelessWidget {
  const TopicsChip({super.key});

  @override
  Widget build(BuildContext context) {
    List<Rx<ChipInfo>> chips = [
      ChipInfo(key: 'World', page: 1).obs,
      ChipInfo(key: 'Finance', page: 1).obs,
      ChipInfo(key: 'Sports', page: 1).obs,
      ChipInfo(key: 'Politics', page: 1).obs,
      ChipInfo(key: 'Entertainment', page: 1).obs,
      ChipInfo(key: 'Technology', page: 1).obs,
      ChipInfo(key: 'Science', page: 1).obs,
      ChipInfo(key: 'Crime', page: 1).obs,
    ];
    var ctrl = Get.find<MyController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: List.generate(
            chips.length,
            (i) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Obx(() {
                var isOn = ctrl.selectedChip.value == i;
                var primaryClr = Theme.of(context).primaryColor.withOpacity(.8);
                return MyButton(
                  onTap: () => ctrl.selectedChip.value = i,
                  label: chips[i].value.key,
                  fontWeight: isOn ? FontWeight.bold : FontWeight.w400,
                  backgroundColor: isOn ? primaryClr : Colors.transparent,
                  textColor: isOn ? Colors.white : primaryClr,
                  border: Border.all(
                    width: .5,
                    color: isOn ? Colors.transparent : primaryClr,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
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
