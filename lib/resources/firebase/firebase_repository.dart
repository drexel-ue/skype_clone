import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRepository {
  /// returns the current user for this app instance or null if one is not found.
  Future<FirebaseUser> getCurrentUser();

  /// initiates native google sign in behavior, grabs credential information from Google, then attempts to log into
  /// Firebase with that information. will return a [FirebaseUser] if a user has already signed in with the corresponding
  /// Google account or null if no user is found.
  Future<FirebaseUser> googleSignIn();

  /// queries the Firebase database for a [DocumentSnapshot] in the `users` collection tied to the passed in [FirebaseUser].
  /// returns a boolean indicating the success or failure of that search.
  Future<bool> authenticateUser(FirebaseUser user);

  /// takes the given [FirebaseUser] and converts it to json to be stored in firebase database.
  Future<void> addDataToDb(FirebaseUser firebaseUser);
}
