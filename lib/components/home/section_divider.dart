import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../my_text.dart';

class SectionDivider extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final String? label;
  final IconData icon;
  const SectionDivider({
    super.key,
    this.title,
    this.label,
    this.leading,
    required this.icon,
  }) : assert(
          title != null || leading != null,
          'Either [title {String}] or [leading {Widget}] is required',
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          leading ?? MyText(title!, weight: FontWeight.bold, size: 18),
          //MyButton(onTap: onSeeAll, label: label ?? 'See All')
        ],
      ),
    );
  }
}
