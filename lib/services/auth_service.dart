import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign Up
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create matching user document in Firestore
      if (credential.user != null) {
        UserModel newUser = UserModel(
          uid: credential.user!.uid,
          email: email,
          createdAt: DateTime.now(),
        );
        await _db.collection('users').doc(newUser.uid).set(newUser.toMap());
      }

      notifyListeners();
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred during sign up.');
    }
  }

  // Sign In
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred during sign in.');
    }
  }

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn.instance.authenticate();
      // authenticate() in v7+ typically throws or returns a non-null account if successful
      // but if your local analysis says it can't be null, we remove the check.

      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;
      
      // For accessToken in v7+, we use authorizeScopes
      final authorization = await googleUser.authorizationClient.authorizeScopes(['email', 'profile']);
      final accessToken = authorization.accessToken;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Create user document in Firestore if it doesn't exist
      if (userCredential.user != null) {
        final userDoc = await _db.collection('users').doc(userCredential.user!.uid).get();
        if (!userDoc.exists) {
          UserModel newUser = UserModel(
            uid: userCredential.user!.uid,
            email: userCredential.user!.email ?? '',
            createdAt: DateTime.now(),
          );
          await _db.collection('users').doc(newUser.uid).set(newUser.toMap());
        }
      }

      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred during Google sign in.');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
    notifyListeners();
  }

  // Error handling helper
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'weak-password':
        return 'The password provided is too weak.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
