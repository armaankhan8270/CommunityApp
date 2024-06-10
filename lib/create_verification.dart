import 'package:community_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCommunity extends StatelessWidget {
  const AddToCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 550,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            //  gradient: LinearGradient(begin: bottomr)
            color: Color(0xFF120C6E)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                "Are You Live In This Community?",
                style: GoogleFonts.croissantOne(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Divider(),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Name ?",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.perm_identity),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Are You Wanna part of this or just visiter ?",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Do You Know This Community ?",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.question_mark_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the Secret Code Of this community ?",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.security_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Submit Successfully"),
                  ),
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "Join",
                  style: GoogleFonts.merriweather(
                      color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
