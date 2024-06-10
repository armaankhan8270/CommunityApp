import 'package:community_app/create_verification.dart';
import 'package:community_app/dashboard.dart';
import 'package:community_app/data_community_project.dart';
import 'package:community_app/data_comunities.dart';
// import 'package:community_app/dashboard.dart';
import 'package:community_app/detail_community_page.dart';
import 'package:community_app/data_detailed_community.dart';
import 'package:community_app/imageurl.dart';
import 'package:community_app/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Community {
  final String name;
  final String description;
  final int numberOfProjects;
  final String location; // Add location
  final int totalMembers; // Add totalMembers
  final int activeMembers;
  final String url; // Add activeMembers

  Community(this.name, this.description, this.numberOfProjects, this.location,
      this.totalMembers, this.activeMembers, this.url);
}

class CommunitiesPage extends StatefulWidget {
  CommunitiesPage({
    Key? key,
  }) : super(key: key);

  @override
  _CommunitiesPageState createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  final List<Community> communityList = communityListsData;

  CollectionReference users = FirebaseFirestore.instance.collection('notes');
  Future<void> getUsers() async {
    QuerySnapshot querySnapshot = await users.get();
    int count = 0;

    querySnapshot.docs.forEach((doc) {
      count++;
      print(
          'Name: ${doc['title']}, Email: ${doc['subject']}, Age: ${doc['content']}');
      if (count > 5) {
        return;
      }
    });
  }

  Future<void> addCommunityProject(CommunityProject project) async {
    // Reference to the Firestore collection where you want to store the data
    CollectionReference projectsCollection =
        FirebaseFirestore.instance.collection('community_project_short');

    try {
      await projectsCollection.add({
        'title': project.title,
        'description': project.description,
        'imageUrl': project.imageUrl,
        'category': project.category,
        'progress': project.progress,
      });
      print('Community project added to Firestore');
    } catch (e) {
      print('Error adding community project: $e');
    }
  }

  Future<void> addCommunties(Community project) async {
    // Reference to the Firestore collection where you want to store the data
    CollectionReference projectsCollection =
        FirebaseFirestore.instance.collection('communities');

    try {
      await projectsCollection.add({
        'name': project.name, // Add name
        'description': project.description,
        'numberOfProjects': project.numberOfProjects, // Add numberOfProjects
        'location': project.location, // Add location
        'totalMembers': project.totalMembers, // Add totalMembers
        'activeMembers': project.activeMembers,
        'url': project.url, // Add url
      });
      print('Community  added to Firestore');
    } catch (e) {
      print('Error adding community : $e');
    }
  }

  Future<void> addCommunitiesProjectDeatil(
      DetailedCommunityProject project) async {
    // Reference to the Firestore collection where you want to store the data
    CollectionReference projectsCollection =
        FirebaseFirestore.instance.collection('community_project_detail');

    try {
      await projectsCollection.add({
        'title': project.title,
        'description': project.description,
        'imageUrl': project.imageUrl,
        'category': project.category,
        'progress': project.progress,
        'location': project.location,
        'estimatedCost': project.estimatedCost,
        'timeline': project.timeline,
        'comments': project.comments,
        'discussions': project.discussions,
      });
      print('Detailed community project added to Firestore');
    } catch (e) {
      print('Error adding detailed community project: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('communities').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final documents = snapshot.data!.docs;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                elevation: 10,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF120C6E),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'communityList/Areasss',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Montserrat', // Customize font
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: communityList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: NetworkImage(
                      //         "https://img.freepik.com/premium-photo/3d-illustration-agriculture-field-isolated-white-background-farming-concept_439318-582.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais"),
                      //     fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: communityList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.grey.shade500.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Image.network(
                                      imagesOfCommunity[index],
                                      fit: BoxFit.cover,
                                    ),
                                    // Image.asset(
                                    //   "images/2.jpg",
                                    //   fit: BoxFit.cover,
                                    // ),
                                    ListTile(
                                      title: Text(
                                        communityList[index].name,
                                        style: GoogleFonts.croissantOne(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      subtitle: Text(
                                          communityList[index].description),
                                      trailing: Text(
                                        '${communityList[index].location}',
                                        style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (conext) =>
                                                            CommunityDetailsPage(
                                                                communityList[
                                                                    index])));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    Colors.deepPurple.shade900,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 12,
                                                ),
                                              ),
                                              child: const Text(
                                                'Details',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (conext) =>
                                                            const DashboardPage()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    Colors.deepPurple.shade900,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 12,
                                                ),
                                              ),
                                              child: const Text(
                                                'Preview',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (conext) =>
                                                            const AddToCommunity()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    Colors.deepPurple.shade900,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 12,
                                                ),
                                              ),
                                              child: const Text(
                                                'Join',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 14,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (conext) =>
                                                            UsersPage()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    Colors.deepPurple.shade900,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 12,
                                                ),
                                              ),
                                              child: const Text(
                                                'Members',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
// Import Google Fonts for custom typography
