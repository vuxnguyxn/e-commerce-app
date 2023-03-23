import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

String authErrorSignIn = '';
String authErrorResetPassword = '';
String authErrorUpdateProfile = '';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isSignIn() async {
    var user = currentUser;
    return user != null;
  }

  Future<void> updateProfile(
      {required String displayName,
      required String phone,
      required String birthday,
      required String gender,
      required String username,
      required String country,
      required String photoURL}) async {
    await currentUser?.updateDisplayName(displayName);
    await currentUser?.updatePhotoURL(photoURL);

    DatabaseReference ref =
        _firebaseDatabase.ref('account/${currentUser!.uid}');
    await ref.set({
      "username": username,
      "birthday": birthday,
      "gender": gender,
      "phone": phone,
      "country": country,
    });
  }
}
