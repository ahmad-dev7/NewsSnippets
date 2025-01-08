import 'package:flutter/material.dart';

class MyTextIconButton extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final VoidCallback? onTap;
  const MyTextIconButton(
      {super.key, required this.leading, required this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: leading,
      label: trailing,
      style: TextButton.styleFrom(
        // disabledBackgroundColor: Colors.transparent,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(.1),
        iconColor: Theme.of(context).primaryColor,
        disabledIconColor:
            Theme.of(context).colorScheme.secondary.withOpacity(.4),
        textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
