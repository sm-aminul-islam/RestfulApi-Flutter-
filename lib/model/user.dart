import 'dart:ui';

import 'package:api_call/model/user_dob.dart';
import 'package:api_call/model/user_location.dart';
import 'package:api_call/model/user_name.dart';
import 'package:api_call/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nut;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nut,
      required this.name,
      required this.dob,
      required this.location,
      required this.picture});
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDob.fromMap(e['dob']);

    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nut: e['nat'],
        name: name,
        dob: dob,
        location: location,
        picture: picture);
  }
  String get fullName {
    return '${name.title} ${name.first}${name.last}';
  }
}
