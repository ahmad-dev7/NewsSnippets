import 'package:flutter/material.dart';
import 'my_text.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  final EdgeInsets? padding;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final double? fontSize;
  final MyText? text;
  const MyButton({
    super.key,
    this.onTap,
    this.label,
    this.padding,
    this.radius,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.fontWeight,
    this.fontSize,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: radius ?? BorderRadius.circular(20),
      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
      child: AnimatedContainer(
        duration: Durations.long1,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(20),
          border: border ?? Border.all(width: 0, color: Colors.transparent),
          color: backgroundColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(.1),
        ),
        child: text ??
            MyText(
              label!,
              weight: fontWeight,
              size: fontSize,
              color: textColor ?? Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
