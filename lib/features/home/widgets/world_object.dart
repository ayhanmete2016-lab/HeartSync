import 'package:flutter/material.dart';

class WorldObject extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const WorldObject({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}