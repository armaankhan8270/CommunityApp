import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Sign-In Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await _handleSignIn();
            if (user != null) {
              // Successfully signed in with Google
              print("Signed in as ${user.displayName}");
            } else {
              // Sign in failed
              print("Sign in failed");
            }
          },
          child: Text("Sign in with Google"),
        ),
      ),
    );
  }
}
