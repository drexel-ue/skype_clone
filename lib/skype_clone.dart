import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase/firebase_repository_impl.dart';
import 'package:skype_clone/ui/home.dart';
import 'package:skype_clone/ui/login.dart';

class SkypeClone extends StatelessWidget {
  const SkypeClone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skype Clone',
      theme: ThemeData.dark(),
      home: FutureBuilder(
        future: FirebaseRepositoryImpl().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          return snapshot.hasData ? Home() : Login();
        },
      ),
    );
  }
}
