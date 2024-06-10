import 'package:community_app/data_comunities.dart';
import 'package:community_app/list_of_community.dart';
import 'package:flutter/material.dart';
import 'package:community_app/data_members.dart';
import 'package:google_fonts/google_fonts.dart';

class Members extends StatefulWidget {
  const Members({
    Key? key,
  }) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community Members',
          style: GoogleFonts.croissantOne(color: Colors.white),
        ),
        backgroundColor: Color(0xFF120C6E), // Change the app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("images/2.jpg"), // Set your background image
            //   fit: BoxFit.cover,
            // ),
            ),
        child: ListView.builder(
          itemCount: membersOfCommunity.length,
          itemBuilder: (BuildContext context, int index) {
            final member = membersOfCommunity[index];
            return MemberCard(
              member: member,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Map<String, dynamic> member;
  final int index;
  MemberCard({required this.member, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF120C6E), // Header background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  communityListsData[index].name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Header text color
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileInfo(label: 'Head', value: member['head']),
                  ListTileInfo(label: 'Chairman', value: member['Chairman']),
                  ListTileInfo(label: 'Treasurer', value: member['tressaurer']),
                  ListTileInfo(
                    label: 'Maintenance Supervisor',
                    value: member['Maintenance Supervisor'],
                  ),
                  ListTileInfo(
                      label: 'Legal Advisor', value: member['Legal Advisor']),
                  ListTileInfo(
                    label: 'Security Officer',
                    value: member['Security Officer'],
                  ),
                  ListTileInfo(
                    label: 'Rules and Regulations Coordinator',
                    value: member['Rules and Regulations Coordinator'],
                  ),
                  ListTileInfo(
                    label: 'Event Organizer',
                    value: member['Event Organizer'],
                  ),
                  ListTileInfo(
                    label: 'Name Of Communit',
                    value: communityListsData[index].name,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileInfo extends StatelessWidget {
  final String label;
  final String value;

  ListTileInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        label,
        style: GoogleFonts.merriweather(
            color: Color(0xFF120C6E),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      subtitle: Text(value),
    );
  }
}
