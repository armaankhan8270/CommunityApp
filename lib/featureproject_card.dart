// ignore_for_file: unused_import

import 'package:community_app/data_detailed_community.dart';
import 'package:community_app/members.dart';
import 'package:community_app/project_details.dart';
import 'package:community_app/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:community_app/data_community_project.dart';
import 'package:google_fonts/google_fonts.dart'; // Replace with your actual model import

class FeaturedProjectCard extends StatelessWidget {
  final CommunityProject project;
  final DetailedCommunityProject project2;
  FeaturedProjectCard(
      {super.key, required this.project, required this.project2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10.0), color: Colors.black
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          // padding: EdgeInsets.all(10),
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.shade500.withOpacity(0.5),
            //     spreadRadius: 1,
            //     blurRadius: 3,
            //     offset: Offset(0, 3),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.st,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    project.imageUrl,
                    height: 400.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        // Add logic to support or like the project
                      },
                      icon: const Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFF120C6E),
                  // borderRadius: BorderRadius.circular(15),
                  // gradient: const LinearGradient(
                  //   colors: [Colo],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      project.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      project.description,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    LinearProgressIndicator(
                      value: project.progress / 100.0,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${project.progress.toStringAsFixed(1)}% Complete',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add logic to navigate to project details page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailPage2(
                                  project: project2,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            // foregroundColor: Color(0xFF120C6E),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Detail',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF120C6E),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.white,
                        // gradient: const LinearGradient(
                        //   colors: [Color(0xFF120C6E), Color(0xFF120C6E)],
                        //   begin: Alignment.bottomLeft,
                        //   end: Alignment.topRight,
                        // ),
                        // color: Colors.white
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
                                          builder: (conext) => Members()));
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF120C6E),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Members",
                                          style: GoogleFonts.merriweather(
                                              color: Colors.white)),
                                      WidgetSpan(
                                        child: Icon(Icons.view_headline_sharp,
                                            size: 14),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // Add your action here for Button 3
                                },
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF120C6E),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Good ",
                                          style: GoogleFonts.merriweather(
                                              color: Colors.white)),
                                      WidgetSpan(
                                        child: Icon(Icons.thumb_up, size: 14),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (conext) =>
                                  //             AddToCommunity()));
                                },
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF120C6E),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Not Good",
                                          style: GoogleFonts.merriweather(
                                              color: Colors.white)),
                                      WidgetSpan(
                                        child: Icon(Icons.thumb_down, size: 14),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
