import 'package:community_app/data_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Users",
          textAlign: TextAlign.center,
          style: GoogleFonts.croissantOne(fontSize: 32),
        ),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ProfileCard(profile: profile);
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, dynamic> profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10), // Rounded corners
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/3.jpg', // Replace with your image asset path
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xFF120C6E),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    profile['name'],
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Age: ${profile['age']} | Community: ${profile['community']} | Post: ${profile['post']}',
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 8), // Add some spacing
                Text(
                  'Remark: ${profile['remark']}',
                  style: GoogleFonts.merriweather(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
