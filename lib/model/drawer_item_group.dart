import 'package:january3_drawer/model/drawer_item.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerItemGroup {
  final String header;
  final List<DrawerItem> items;

  const DrawerItemGroup({
    @required this.items,
    this.header,
  });
}
