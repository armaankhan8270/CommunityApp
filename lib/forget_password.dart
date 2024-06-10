import 'package:community_app/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgtetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign In'),
      // ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ], borderRadius: BorderRadius.circular(15), color: Color(0xFF120C6E)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Dont Worrry ",
              style: GoogleFonts.merriweather(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "password",
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.key),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-in logic here
              },
              child: const Text('Send Otp'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login?',
                  style: GoogleFonts.merriweather(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Text('Or sign in with:',
                style: GoogleFonts.merriweather(color: Colors.white)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement social media sign-in (e.g., Google) here
                  },
                  icon: const Icon(Icons.g_translate),
                  label: const Text('Google'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement social media sign-in (e.g., Facebook) here
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('Facebook'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
