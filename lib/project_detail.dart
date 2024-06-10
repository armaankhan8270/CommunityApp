import 'package:community_app/data_detailed_community.dart';
import 'package:community_app/project_details.dart';
import 'package:flutter/material.dart';
import 'package:community_app/data_community_project.dart';

class ProjectDetailPage extends StatelessWidget {
  final CommunityProject project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        actions: [
          // Add an action button (e.g., a share icon)
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Add logic to handle sharing the project
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Display project image
              AspectRatio(
                aspectRatio: 16 / 9, // Set the aspect ratio for the image
                child: Image.network(
                  project.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16.0),

              // Display project title
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8.0),

              // Display project category
              Text(
                'Category: ${project.category}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 16.0),

              // Display project description
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),

              const SizedBox(height: 16.0),

              // Display project progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress: ${project.progress.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) =>
                                  ProjectDetailPage(project: project)));

                      // Add logic to support or like the project
                    },
                    child: const Text('more detail'),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Add more project details here as needed
              // For example, you can display project contributors, project timeline, etc.
            ],
          ),
        ),
      ),
    );
  }
}
