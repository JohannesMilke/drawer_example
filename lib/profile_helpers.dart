import 'package:january3_drawer/data/profiles.dart';
import 'package:january3_drawer/model/profile.dart';

List<Profile> getNotSelectedProfiles({int selectedIndex}) {
  final Profile selectedProfile = profiles[selectedIndex];
  return List.of(profiles)
    ..removeWhere((profile) => profile == selectedProfile);
}
