import 'package:flutter/material.dart';
import 'package:january3_drawer/data/drawer_items.dart';
import 'package:january3_drawer/data/profiles.dart';
import 'package:january3_drawer/drawer_group_helpers.dart';
import 'package:january3_drawer/model/drawer_item_group.dart';
import 'package:january3_drawer/model/profile.dart';
import 'package:january3_drawer/profile_helpers.dart';

class DrawerWidget extends StatefulWidget {
  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  int selectedDrawerIndex;
  int selectedProfileIndex;

  final String backgroundUrl =
      'https://cdn-images-1.medium.com/max/1920/1*-hRmYuz-CyZKe1GYcMTPPw.jpeg';

  @override
  void initState() {
    super.initState();

    selectedDrawerIndex = 0;
    selectedProfileIndex = 0;
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: <Widget>[
            buildAccountInfo(),
            Expanded(child: buildDrawerList()),
          ],
        ),
      );

  Widget buildDrawerList() => ListView.separated(
        itemBuilder: (BuildContext context, int index) => buildDrawerItemGroup(
            drawerGroups[index], toIndexOffset(drawerGroups, index)),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: drawerGroups.length,
        padding: EdgeInsets.zero,
      );

  Widget buildDrawerItemGroup(DrawerItemGroup group, int indexOffset) {
    final List<Widget> items = group.items
        .asMap()
        .map((index, item) {
          final int currentIndex = index + indexOffset;
          return MapEntry(
            index,
            ListTile(
              leading: Icon(item.icon),
              title: Text(item.name),
              selected: selectedDrawerIndex == currentIndex,
              onTap: () {
                setState(() {
                  selectedDrawerIndex = currentIndex;
                });

                final item = getOffsetIndex(drawerGroups, currentIndex);
                print(
                    'Selected index $selectedDrawerIndex with name ${item.name}');
              },
            ),
          );
        })
        .values
        .toList();

    return Column(
      children: [
        group.header != null ? buildHeader(group.header) : Container(),
      ]..addAll(items),
    );
  }

  Widget buildHeader(String title) => Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: double.infinity,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subhead,
        ),
      );

  Widget buildAccountInfo() {
    final List<Profile> otherProfiles =
        getNotSelectedProfiles(selectedIndex: selectedProfileIndex);
    final Profile selectedProfile = profiles[selectedProfileIndex];

    return UserAccountsDrawerHeader(
      accountName: Text(selectedProfile.name),
      accountEmail: Text(selectedProfile.email),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: Image.asset(selectedProfile.image),
      otherAccountsPictures: otherProfiles
          .map((profile) => InkWell(
                child: Image.asset(profile.image),
                onTap: () {
                  setState(() {
                    selectedProfileIndex = profiles.indexWhere(
                        (currentProfile) => currentProfile == profile);
                  });
                },
              ))
          .toList(),
    );
  }
}
