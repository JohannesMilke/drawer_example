import 'package:january3_drawer/model/drawer_item.dart';
import 'package:january3_drawer/model/drawer_item_group.dart';

int toIndexOffset(List<DrawerItemGroup> drawerGroups, int index) => drawerGroups
    .sublist(0, index)
    .expand((group) => group.items)
    .toList()
    .length;

DrawerItem getOffsetIndex(List<DrawerItemGroup> drawerGroups, int offsetIndex) {
  int globalIndex = 0;

  for (DrawerItemGroup group in drawerGroups) {
    final itemCount = group.items.length;
    if (globalIndex + itemCount <= offsetIndex) {
      globalIndex += itemCount;
    } else {
      final localIndex = offsetIndex - globalIndex;
      return group.items[localIndex];
    }
  }

  throw Exception('Item with index $offsetIndex not found');
}
