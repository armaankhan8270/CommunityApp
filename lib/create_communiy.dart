// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateCommunties extends StatefulWidget {
  const CreateCommunties({super.key});

  @override
  State<CreateCommunties> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunties> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool success = false;
  String _title = '';
  String secretCode = '';
  String category = " ";
  String contactNumber = '';
  String emailid = "";
  String purpose = "";
  String strength = "";

  String _description = '';
  String _numberOfProjets = '';
  String _imageUrl = '';
  String _location = '';
  bool _isFollowed = false;

  Future<void> submitDataToFirebase(
    String title,
    String secretCode,
    String category,
    String contactNumber,
    String emailid,
    String purpose,
    String strength,
    String description,
    String numberOfProjects,
    String imageUrl,
    String location,
  ) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference communities =
          FirebaseFirestore.instance.collection('allcommunity');

      // Add a new document to the collection with the provided data
      await communities.add({
        'title': title,
        'secretCode': secretCode,
        'category': category,
        'contactNumber': contactNumber,
        'emailid': emailid,
        'purpose': purpose,
        'strength': strength,
        'description': description,
        'numberOfProjects': numberOfProjects,
        'imageUrl':
            "https://img.freepik.com/free-vector/fragment-city-with-luxury-hotel-building_1284-19433.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
        'location': location,
        // Add other fields as needed
      });

      print('Data submitted to Firebase successfully');
      setState(() {
        success = true;
      });
    } catch (e) {
      print('Error submitting data to Firebase: $e');
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
          child: Text(
            'Create Community ',
            style: GoogleFonts.croissantOne(
                fontWeight: FontWeight.bold, fontSize: 32),
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
                    category = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
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
                      prefixIcon: Icon(
                          color: Colors.deepPurple.shade800, Icons.category),
                      labelText: 'Ctaegory'),
                  onSaved: (value) {
                    category = value!;
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
                          Icon(color: Colors.deepPurple.shade800, Icons.phone),
                      labelText: 'Contact Number'),
                  onSaved: (value) {
                    contactNumber = value!;
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
                          Icon(color: Colors.deepPurple.shade800, Icons.mail),
                      labelText: 'Email id'),
                  onSaved: (value) {
                    emailid = value!;
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
                          Icons.onetwothree_sharp),
                      labelText:
                          'Strength (number of socity or building or house)'),
                  onSaved: (value) {
                    strength = value!;
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
                          Icons.lock_outlined),
                      labelText: 'Secret code'),
                  onSaved: (value) {
                    secretCode = value!;
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
                          Icons.golf_course_sharp),
                      labelText: 'Prupose '),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    purpose = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade500.withOpacity(0.5),
              //         spreadRadius: 1,
              //         blurRadius: 3,
              //         offset: Offset(0, 3),
              //       ),
              //     ],
              //     borderRadius: BorderRadius.circular(15),
              //     color: Colors.white,
              //   ),
              //   child: TextFormField(
              //     style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
              //     decoration: InputDecoration(
              //         hintStyle: GoogleFonts.merriweather(),
              //         border: InputBorder.none,
              //         prefixIcon: Icon(
              //             color: Colors.deepPurple.shade800,
              //             Icons.attach_money_sharp),
              //         labelText: 'Donation Amount'),
              //     keyboardType: TextInputType.number,
              //     onSaved: (value) {
              //       _donationAmount = double.parse(value!);
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await submitDataToFirebase(
                      _title,
                      secretCode,
                      category,
                      contactNumber,
                      emailid,
                      purpose,
                      strength,
                      _description,
                      _numberOfProjets,
                      _imageUrl,
                      _location,
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
              Visibility(
                  visible: true,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Text("Submit successfull"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
