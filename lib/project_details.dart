import 'package:community_app/data_community_project.dart';
import 'package:community_app/data_detailed_community.dart';
import 'package:community_app/fund.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDetailPage2 extends StatelessWidget {
  final DetailedCommunityProject project;

  ProjectDetailPage2({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Details',
          style: GoogleFonts.merriweatherSans(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              size: 28.0,
            ),
            onPressed: () {
              // Add logic to handle sharing the project
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
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
            color: Color(0xFF120C6E),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                project.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.croissantOne(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Divider(),
              // Display project image
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    project.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // child: Image.asset(
                  //   "images/2.jpg",
                  //   width: double.infinity,
                  //   // height: 300,
                  // ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' ${project.progress.toStringAsFixed(1)}% complete',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ' ${project.category}',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 15.0,
                      // color: Colors.grey,
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 16.0),

              // Display project title

              const Divider(
                endIndent: 10,
                indent: 10,
              ),

              // Display project category

              const SizedBox(height: 16.0),

              // Display project description
              Text(
                '${project.description} ${project.description}',
                style: GoogleFonts.merriweather(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // Display project progress

              const SizedBox(height: 16.0),

              // Display project location on a map
              // You can use a map widget or integrate with a map service like Google Maps.

              // Display estimated cost and timeline
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade500.withOpacity(0.5),
                  //     spreadRadius: 1,
                  //     blurRadius: 3,
                  //     offset: const Offset(0, 3),
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cost:',
                      style: GoogleFonts.merriweatherSans(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '\$${project.estimatedCost.toStringAsFixed(2)}',
                      style: GoogleFonts.merriweatherSans(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(width: 16.0),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (conext) => FundraisingPage(
                                    data: Fund(
                                        goalAmount: project.estimatedCost,
                                        raisedAmoint: project.donationAmount,
                                        title: project.title))));
                      },
                    ),
                    Text(
                      '\$${project.donationAmount.toStringAsFixed(2)}',
                      style: GoogleFonts.merriweatherSans(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              // Comments and discussions section

              // Add a comment section here. You can use a ListView.builder to display comments.

              // ... Your existing code ...

// Comments and discussions section
              const Divider(), // Add a divider after the description
              const SizedBox(
                height: 10,
              ),
// Options to follow, vote, or donate
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to follow the project
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to vote for the project
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Vote',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to donate to the project
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Donate',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FundraisingPage(
                                      data: fundlist[0],
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text(
                        'Support Project',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Divider(), // Add a divider before the "Comments and Discussions" title

              const Row(
                children: [
                  Icon(
                    Icons.comment,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Comments and Discussions',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),

// Comments section
              Column(
                children: [
                  for (int i = 0; i < project.comments.length; i++)
                    Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.white,
                      ),
                      child: Card(
                        color: Color(0xFF120C6E),
                        margin: const EdgeInsets.all(10),
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.comments[i],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Armaankhan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '2 November 2023',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              )
// ... Rest of your code ...
            ],
          ),
        ),
      ),
    );
  }
}
