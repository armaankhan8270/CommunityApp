// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _imageUrl = '';
  String _category = '';
  double _progress = 0.0;
  String _location = '';
  String _estimatedCost = '';
  String _timeline = '';
  List<String> _comments = [];
  List<String> _discussions = [];
  bool _isFollowed = false;
  int _votes = 0;
  double _donationAmount = 0.0;
  Future<void> submitSecondSetDataToFirebase(
      String title,
      String description,
      String imageUrl,
      String category,
      double progress,
      String location,
      String estimatedCost,
      String timeline,
      List<String> comments,
      List<String> discussions,
      bool isFollowed,
      int votes,
      double donationAmount) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference communities =
          FirebaseFirestore.instance.collection('detail_community_project');

      // Add a new document to the collection with the provided data
      await communities.add({
        'title': title,
        'description': description,
        'imageUrl':
            "https://img.freepik.com/free-vector/fragment-city-landscape-with-street-cafe_1284-19439.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
        'category': category,
        'progress': progress,
        'location': location,
        'estimatedCost': estimatedCost,
        'timeline': timeline,
        'comments': comments,
        'discussions': discussions,
        'isFollowed': isFollowed,
        'votes': votes,
        'donationAmount': donationAmount,
        // Add other fields as needed
      });

      print('Second set of data submitted to Firebase successfully');
    } catch (e) {
      print('Error submitting second set of data to Firebase: $e');
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
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'detailed of Community Projects ',
              style: GoogleFonts.croissantOne(
                  fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.merriweather(),
                    border: InputBorder.none,

                    // border: InputBorder.none,

                    labelText: 'Title',
                    hintText:
                        'Enter a title', // Hint text displayed inside the input field when empty.
                    prefixIcon: const Icon(
                        Icons.title), // Prefix icon displayed before the input.

                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Colors.red), // Border color when in error state.
                    ),
                    // You can customize other properties like content padding, filled, fillColor, etc.
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  minLines: 5,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.merriweather(),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      color: Colors.deepPurple.shade800,
                      Icons.title_sharp,
                    ),
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(color: Colors.deepPurple.shade800, Icons.image),
                      labelText: 'Image URL'),
                  onSaved: (value) {
                    _imageUrl = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800, Icons.category),
                      labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800,
                          Icons.linear_scale_sharp),
                      labelText: 'Progress'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Progress is required';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Progress must be a number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _progress = double.parse(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800,
                          Icons.location_on_outlined),
                      labelText: 'Location'),
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(color: Colors.deepPurple.shade800, Icons.money),
                      labelText: 'Estimated Cost'),
                  onSaved: (value) {
                    _estimatedCost = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800, Icons.av_timer),
                      labelText: 'Timeline'),
                  onSaved: (value) {
                    _timeline = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800,
                          Icons.comment_sharp),
                      labelText: 'Comments (comma-separated)'),
                  onSaved: (value) {
                    _comments = value!.split(',');
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800, Icons.comment),
                      labelText: 'Discussions (comma-separated)'),
                  onSaved: (value) {
                    _discussions = value!.split(',');
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: CheckboxListTile(
                  title: const Text('Is Followed'),
                  value: _isFollowed,
                  onChanged: (newValue) {
                    setState(() {
                      _isFollowed = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800,
                          Icons.people_outline_rounded),
                      labelText: 'Votes'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _votes = int.parse(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                child: TextFormField(
                  style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.merriweather(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800,
                          Icons.attach_money_sharp),
                      labelText: 'Donation Amount'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _donationAmount = double.parse(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await submitSecondSetDataToFirebase(
                      _title,
                      _description,
                      _imageUrl,
                      _category,
                      _progress,
                      _location,
                      _estimatedCost,
                      _timeline,
                      _comments,
                      _discussions,
                      _isFollowed,
                      _votes,
                      _donationAmount,
                    );
                    // Create and save your DetailedCommunityProject object with the entered values
                    // You can do this here or send the data to another function or screen.
                    print('Data saved');
                  }
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
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
                      color: Colors.white,
                    ),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.merriweather(fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
