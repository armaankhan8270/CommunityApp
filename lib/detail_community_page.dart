import 'package:community_app/create_verification.dart';
import 'package:community_app/list_of_community.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityDetailsPage extends StatefulWidget {
  final Community community;

  CommunityDetailsPage(this.community, {Key? key}) : super(key: key);

  @override
  _CommunityDetailsPageState createState() => _CommunityDetailsPageState();
}

class _CommunityDetailsPageState extends State<CommunityDetailsPage> {
  bool _isContentVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isContentVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'community_name_${widget.community.activeMembers}',
          child: Text(
            widget.community.name,
            style: GoogleFonts.croissantOne(fontSize: 21, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'images/2.jpg',
                      image: widget.community.url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400,
                    ),
                    AnimatedOpacity(
                      opacity: _isContentVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        width: double.infinity,
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF120C6E),
                            // borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                widget.community.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Text(
                                    widget.community.location,
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.merriweather(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${widget.community.numberOfProjects} Projects',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.merriweather(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline_outlined,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    'Total: ${widget.community.totalMembers}',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline_outlined,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    'Active: ${widget.community.activeMembers}',
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                '${widget.community.description} ${widget.community.description}',
                                style: GoogleFonts.merriweather(
                                    fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(10),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Join Now",
                                      style: GoogleFonts.croissantOne(
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddToCommunity()));
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      ),
                                      iconSize: 21,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
