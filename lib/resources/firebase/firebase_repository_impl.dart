import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/resources/firebase/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  /// unchanging instance of [FirebaseAuth] tied to this app instance. will handle all of the authentication through Firebase.
  final _auth = FirebaseAuth.instance;

  /// instance of [GoogleSignIn] class used to perform native google sign in actions and retrieve credential information.
  final _googleSignIn = GoogleSignIn();

  /// shorthand for getting [Firestore] instance for this app as it will be referenced many times in this file.
  /// will handle CRUD relationship between client and Firestore.
  static final _firestore = Firestore.instance;

  @override
  Future<FirebaseUser> getCurrentUser() => _auth.currentUser();

  @override
  Future<FirebaseUser> googleSignIn() async {
    // initiate native google sign in behavior and save account to variable.
    final account = await _googleSignIn.signIn();

    // grab [GoogleSignInAuthentication] object from the returned account.
    final authentication = await account.authentication;

    // create an [AuthCredential] object.
    final credential = GoogleAuthProvider.getCredential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    // use [AuthCredential] object to sign in with Firebase
    final result = await _auth.signInWithCredential(credential);

    // return resulting [FirebaseUser] or null.
    return result.user;
  }

  @override
  Future<bool> authenticateUser(FirebaseUser user) async {
    // query the Firebase database for a document in the users collection belonging to the passed in user.
    final result = await _firestore.collection('users').where('email', isEqualTo: user.email).getDocuments();

    // get the list of documents from the response.
    final documents = result.documents;

    // return a boolean indicating the length of the document list. 1 being a found document and 0 meaning
    // failure to find a document ties to this user.
    return documents.length == 0;
  }

  @override
  Future<void> addDataToDb(FirebaseUser firebaseUser) async {
    // parse [FirebaseUser] into [User] model.
    final user = User.fromFirebaseUser(firebaseUser);

    // convert that [User] to json and create a document in firebase database with that info.
    _firestore.collection('users').document(user.uid).setData(user.toJson());
  }
}
