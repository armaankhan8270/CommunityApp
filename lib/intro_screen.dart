import 'package:community_app/dashboard.dart';
import 'package:community_app/data_comunities.dart';
import 'package:community_app/list_of_community.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class LandingPage extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  LandingPage({super.key});

  void _onIntroEnd(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CommunitiesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // const GoogleFonts.poppins(fontSize: 19.0) =  GoogleFonts.poppins(fontSize: 19.0);
    List<String> allImages = [
      'https://img.freepik.com/free-photo/3d-rendering-new-york-city-isometric-miniature_23-2150598135.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais',
      "https://img.freepik.com/free-vector/suburbian-buildings-isometric-composition-with-view-city-blocks-different-domain-with-flat-pictogram-icons_1284-31611.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
      "https://img.freepik.com/premium-photo/there-is-small-town-with-lot-houses-trees-generative-ai_902338-32309.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
    ];
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome to CommunityBetters",
          body:
              "Empower your community to make a difference in your neighborhood.",
          image: Container(
            height: 900,
            padding: const EdgeInsets.all(20), // Add padding
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20), // Add margin
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(allImages[0]),
                fit: BoxFit.cover,
              ),
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
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
            titleTextStyle: GoogleFonts.merriweather(
                fontSize: 28.0, fontWeight: FontWeight.w700),
            bodyTextStyle: GoogleFonts.merriweather(fontSize: 19.0),
          ),
        ),
        PageViewModel(
          title: "Join Us",
          body: "Sign in or register to start exploring and contributing.",
          image: Container(
            height: 500,
            padding: const EdgeInsets.all(20), // Add padding
            margin: const EdgeInsets.all(20), // Add margin
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(allImages[0]),
                fit: BoxFit.cover,
              ),
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
          ),
          decoration: PageDecoration(
            titleTextStyle: GoogleFonts.merriweather(
                fontSize: 28.0, fontWeight: FontWeight.w700),
            bodyTextStyle: GoogleFonts.merriweather(fontSize: 19.0),
          ),
        ),
        // Add "About Us" page
        PageViewModel(
          title: "About Us",
          body: "Learn more about our mission and team.",
          image: Container(
            height: 500,
            padding: const EdgeInsets.all(20), // Add padding
            margin: const EdgeInsets.all(20), // Add margin
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(allImages[1]),
                fit: BoxFit.cover,
              ),
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
          ),
          decoration: PageDecoration(
            titleTextStyle: GoogleFonts.merriweather(
                fontSize: 28.0, fontWeight: FontWeight.w700),
            bodyTextStyle: GoogleFonts.merriweather(fontSize: 19.0),
          ),
        ),
        // Add "Features" page
        PageViewModel(
          title: "App Features",
          body: "Discover the key features that make our app great.",
          image: Container(
            height: 500,
            padding: const EdgeInsets.all(20), // Add padding
            margin: const EdgeInsets.all(20), // Add margin
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(allImages[2]),
                fit: BoxFit.cover,
              ),
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
          ),
          decoration: PageDecoration(
            titleTextStyle: GoogleFonts.merriweather(
                fontSize: 28.0, fontWeight: FontWeight.w700),
            bodyTextStyle: GoogleFonts.merriweather(fontSize: 19.0),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      done: const Text("Get Started"),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.blue,
        activeColor: Colors.blue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

List<String> allImages = [
  'https://img.freepik.com/free-photo/3d-rendering-new-york-city-isometric-miniature_23-2150598135.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais',
  "https://img.freepik.com/free-vector/suburbian-buildings-isometric-composition-with-view-city-blocks-different-domain-with-flat-pictogram-icons_1284-31611.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
  "https://img.freepik.com/premium-photo/there-is-small-town-with-lot-houses-trees-generative-ai_902338-32309.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
];
