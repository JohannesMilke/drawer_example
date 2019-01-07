import 'package:flutter/material.dart';
import 'package:january3_drawer/model/drawer_item.dart';
import 'package:january3_drawer/model/drawer_item_group.dart';

const DrawerItemGroup drawerGroup1 = DrawerItemGroup(items: [
  DrawerItem(name: 'Inbox', icon: Icons.move_to_inbox),
  DrawerItem(name: 'Starred', icon: Icons.star),
  DrawerItem(name: 'Sent Email', icon: Icons.send),
  DrawerItem(name: 'Drafts', icon: Icons.drafts),
]);

const DrawerItemGroup drawerGroup2 = DrawerItemGroup(
  header: 'Subheader',
  items: [
    DrawerItem(name: 'All Emails', icon: Icons.email),
    DrawerItem(name: 'Trash', icon: Icons.delete),
    DrawerItem(name: 'Spam', icon: Icons.error),
  ],
);

const List<DrawerItemGroup> drawerGroups = [drawerGroup1, drawerGroup2];
