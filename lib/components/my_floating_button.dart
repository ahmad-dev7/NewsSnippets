import 'package:flutter/material.dart';

class FloatingIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;
  const FloatingIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: onTap,
        child: Card.filled(
          elevation: 20,
          color: bgColor ??
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: iconColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
