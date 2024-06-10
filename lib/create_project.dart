import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String projectName = '';
  String description = '';
  String location = '';
  double costEstimate = 0.0;
  String timeline = '';
  String projectImageUrl = ''; // Store the uploaded image URL
  String category = '';
  List<String> benfits = [];
  Future<void> submitThirdSetDataToFirebase(
      String projectName,
      String description,
      String location,
      double costEstimate,
      String timeline,
      String projectImageUrl,
      String category,
      List<String> benefits) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference projects =
          FirebaseFirestore.instance.collection('projects');

      // Add a new document to the collection with the provided data
      await projects.add({
        'projectName': projectName,
        'description': description,
        'location': location,
        'costEstimate': costEstimate,
        'timeline': timeline,
        'projectImageUrl':
            "https://img.freepik.com/premium-photo/3d-rendering-isometric-city-apartment-building-business-concept_408344-135.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
        'category': category,
        'benefits': benefits,
        // Add other fields as needed
      });

      print('Third set of data submitted to Firebase successfully');
    } catch (e) {
      print('Error submitting third set of data to Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
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
              gradient: const LinearGradient(
                colors: [Colors.grey, Colors.blue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: const Text('Create Project')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.black],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(7),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/premium-photo/3d-isometric-buildings-world-top-cities-isometric-buildings_955289-2499.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais'), // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Project Details',
                    style: GoogleFonts.merriweather(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Project Name
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Project Name",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a project name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    projectName = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),

                // Description
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Description",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.message_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a project description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),

                // Location
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Location",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    location = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),

                // Cost Estimate
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Estimated Cost",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid cost estimate';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    costEstimate = double.parse(value ?? '0.0');
                  },
                ),
                const SizedBox(height: 16.0),

                // Timeline
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "How mush days it take",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.timelapse),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project timeline';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    timeline = value ?? '';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Categorey",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.category_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    category = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),

                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Benfits of this project",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the benifits of The Projects';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    benfits = value!.split(',');
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Url of image",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.image),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.merriweather(fontSize: 16.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter url of image';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    projectImageUrl = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),

                // Image Upload

                // Submit Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, save the data and show a preview
                      _formKey.currentState?.save();
                      await submitThirdSetDataToFirebase(
                        projectName,
                        description,
                        location,
                        costEstimate,
                        timeline,
                        projectImageUrl,
                        category,
                        benfits,
                      );
                      print("data saved");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Change the button color here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Submit',
                      style: GoogleFonts.merriweather(
                          fontSize: 16.0, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show a preview dialog with project details
  void showPreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Project Preview'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Project Name: $projectName'),
                Text('Description: $description'),
                Text('Location: $location'),
                Text('Cost Estimate: \$${costEstimate.toStringAsFixed(2)}'),
                Text('Timeline: $timeline'),
                if (projectImageUrl.isNotEmpty)
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(projectImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Edit'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement project submission logic here
                // You can send the data to a backend API or perform other actions.
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change the button color here
                elevation: 5.0, // Add elevation
              ),
              child: Text('Submit',
                  style: GoogleFonts.merriweather(fontSize: 16.0)),
            ),
          ],
        );
      },
    );
  }
}
