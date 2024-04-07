import 'package:bengaluru_townsquare/models/friend.dart';

class User {
  final String id;
  final String firstName;
  final String? lastName;
  final String gender;
  final String phone;
  final String username;
  final String dob;
  final String? _profile;
  final String? bio;

  final List<Friend> friends;

  User(
      {required this.id,
      required this.firstName,
      this.lastName,
      required this.gender,
      required this.phone,
      required this.username,
      required this.dob,
      this.bio,
      profile,
      friends})
      : _profile = profile,
        friends = friends ?? List.empty();

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      firstName: data["name"],
      lastName: data["lastName"],
      gender: data["gender"],
      bio: data["bio"],
      phone: data["phone"],
      id: data["id"],
      username: data["username"],
      dob: data["dob"],
      profile: data["profile"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": firstName,
      "lastName": lastName,
      "gender": gender,
      "phone": phone,
      "username": username,
      "dob": dob,
      "profile": _profile,
      "bio": bio,
      "friends": friends.map((e) => e.toJson())
    };
  }

  String profile() {
    return _profile ??
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.kindpng.com%2Fpicc%2Fm%2F451-4517876_default-profile-hd-png-download.png&f=1&nofb=1&ipt=cdc206ec4913c1c8bd8338c747e993d10d85f484ea20a0cc6c3dd4206f2d59d2&ipo=images";
  }
}
