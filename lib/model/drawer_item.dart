import 'package:flutter/material.dart';

@immutable
class DrawerItem {
  final String name;
  final IconData icon;

  const DrawerItem({
    @required this.name,
    @required this.icon,
  });
}
