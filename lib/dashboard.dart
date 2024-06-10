import 'package:community_app/data_community_project.dart';
import 'package:community_app/create_project.dart';
import 'package:community_app/data_detailed_community.dart';
import 'package:community_app/featureproject_card.dart';
import 'package:community_app/fund.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community Dashboard',
          style: GoogleFonts.merriweather(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: Color(0xFF120C6E), // Set the background color
        elevation: 4.0, // Add elevation for a raised effect
        actions: <Widget>[
          // Add an action button (e.g., a search icon)
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Add logic to handle the search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Featured or Popular Community Projects Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15),
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
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text(
                            'Featured Projects',
                            style: TextStyle(
                              fontSize:
                                  22, // Increased font size for a bolder look
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set the text color to blue
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey
                                  .shade100, // Background color for the "Add Project" button
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (conext) =>
                                                  CreateProjectPage()));

                                      // Navigator.push(context, )
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )

                                    // Icon color
                                    ),
                                const SizedBox(width: 4),
                                const Text(
                                  "Add Project",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Replace 'featuredProjects' with actual data
                  // Use ListView.builder with FeaturedProjectCard to display the projects
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: featuredProjects.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      CommunityProject project = featuredProjects[index];
                      DetailedCommunityProject project2 =
                          communityProjects[index];
                      return FeaturedProjectCard(
                        project: project,
                        project2: project2,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Quick Links Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Create a New Project Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProjectPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text(
                      'Create a New Project',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // Browse Categories Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundraisingCard(
                                  goalAmount: 10000,
                                  projectName: "Seat on graden",
                                  raisedAmount: 5321,
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text(
                      'Browse Categories',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Notifications and Community Events Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Placeholder notifications list
                  buildNotificationItem('New Project Posted',
                      'A community member has posted a new project.'),
                  buildNotificationItem('Event Reminder',
                      'Don\'t forget about the community cleanup event tomorrow.'),
                  buildNotificationItem('Volunteer Needed',
                      'We need volunteers for the food drive. Can you help?'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a notification item
  Widget buildNotificationItem(String title, String message) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(message),
      leading: const Icon(Icons.notifications),
      onTap: () {
        // Add logic to handle notification click
      },
    );
  }
}
