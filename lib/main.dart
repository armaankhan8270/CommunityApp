import 'package:community_app/create_verification.dart';
import 'package:community_app/create_detailed_of_community.dart';
import 'package:community_app/create_communiy.dart';
import 'package:community_app/dashboard.dart';
import 'package:community_app/data_comunities.dart';
import 'package:community_app/intro_screen.dart';
import 'package:community_app/list_of_community.dart';
import 'package:community_app/firebase_options.dart';
import 'package:community_app/members.dart';
import 'package:community_app/sigin_in.dart';
import 'package:community_app/signinpages.dart';
import 'package:community_app/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  List<Widget> pages = [
    LandingPage(),
    SignInPage(),
    CommunitiesPage(),
    const CreateCommunity()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CommunityBetter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (int newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Start',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_city), label: 'Communities'),
            BottomNavigationBarItem(
                icon: Icon(Icons.create_new_folder_rounded),
                label: 'Create community'),
          ],
        ),
      ),
    );
  }
}
