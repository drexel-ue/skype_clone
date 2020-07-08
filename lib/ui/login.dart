import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase/firebase_repository_impl.dart';
import 'package:skype_clone/ui/home.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  final _methods = FirebaseRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () => _performLogin(context),
          child: Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin(BuildContext context) async {
    final user = await _methods.googleSignIn();
    if (user != null) await _authenticateUser(user, context);
  }

  Future<void> _authenticateUser(FirebaseUser user, BuildContext context) async {
    if (await _methods.authenticateUser(user)) _methods.addDataToDb(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Home()),
    );
  }
}