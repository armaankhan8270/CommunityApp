import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> notifications = [
    "Project update: New feature added",
    "Community meeting on 2023-10-05",
    "Project milestone reached",
    // Add more notifications as needed
  ];

  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedFilter,
            items: ["All", "Project Updates", "Community Events"]
                .map((String filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Text(filter),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Change the parameter type to String?
              setState(() {
                selectedFilter = newValue as String;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                if (selectedFilter == "All" ||
                    notifications[index].contains(selectedFilter)) {
                  return Container(
                    decoration: BoxDecoration(
                        // color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        notifications[index],
                        style: GoogleFonts.merriweather(fontSize: 18),
                      ),
                    ),
                  );
                } else {
                  return Container(); // Hide notifications that don't match the filter
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
