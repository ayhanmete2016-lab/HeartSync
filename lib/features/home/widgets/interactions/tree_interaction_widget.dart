import 'package:flutter/material.dart';

class TreeInteractionWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const TreeInteractionWidget({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}