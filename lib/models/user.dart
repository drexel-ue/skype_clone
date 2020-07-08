import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype_clone/utils/utils.dart';

class User {
  User({
    this.email,
    this.name,
    this.profilePhoto,
    this.state,
    this.status,
    this.uid,
    this.username,
  });

  String uid, name, email, username, status, profilePhoto;
  int state;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        name: json['name'],
        profilePhoto: json['profilePhoto'],
        state: json['state'],
        status: json['status'],
        uid: json['uid'],
        username: json['username'],
      );

  factory User.fromFirebaseUser(FirebaseUser user) => User(
        email: user.email,
        name: user.displayName,
        profilePhoto: user.photoUrl,
        uid: user.uid,
        username: Utils.getUsername(user.email),
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'profilePhoto': profilePhoto,
        'state': state,
        'status': status,
        'uid': uid,
        'username': username,
      };

  String toString() => '''
  User {
    email: $email
    name: $name
    profilePhoto: $profilePhoto
    state: $state
    status: $status
    uid: $uid
    username: $username
  }
  ''';
}
