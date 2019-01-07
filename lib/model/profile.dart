import 'package:meta/meta.dart';

@immutable
class Profile {
  final String name;
  final String email;
  final String image;

  const Profile({
    @required this.name,
    @required this.email,
    @required this.image,
  });
}
