import 'package:community_app/imageurl.dart';

class Fund {
  final String title;
  final double raisedAmoint;
  final double goalAmount;
  // Progress as a percentage (0.0 - 100.0)

  Fund({
    required this.title,
    required this.raisedAmoint,
    required this.goalAmount,
  });
}

class CommunityProject {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final double progress; // Progress as a percentage (0.0 - 100.0)

  CommunityProject({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.progress,
  });
}

List<Fund> fundlist = [
  Fund(
    title: "Fundraiser 4",
    raisedAmoint: 750.0,
    goalAmount: 3000.0,
  ),
  Fund(
    title: "Fundraiser 5",
    raisedAmoint: 2000.0,
    goalAmount: 5000.0,
  ),
  Fund(
    title: "Fundraise4",
    raisedAmoint: 300.0,
    goalAmount: 1000.0,
  ),
  Fund(
    title: "Fundraiser 7",
    raisedAmoint: 4000.0,
    goalAmount: 8000.0,
  ),
];

// Example list of community projects
List<CommunityProject> featuredProjects = [
  CommunityProject(
    title: 'Community Garden Expansion',
    description:
        'Expand our community garden to grow more fresh produce for local residents.',
    imageUrl: imagesConstruction[0],
    category: 'Gardening',
    progress: 45.0,
  ),

  CommunityProject(
    title: 'Youth Sports Program',
    description:
        'Start a youth sports program to promote physical activity and teamwork among local children.',
    imageUrl: imagesConstruction[1],
    category: 'Sports',
    progress: 40.0,
  ),
  CommunityProject(
    title: 'Elderly Care Center Renovation',
    description:
        'Renovate the local elderly care center to provide better facilities and care.',
    imageUrl: imagesConstruction[2],
    category: 'Community Care',
    progress: 60.0,
  ),
  // Add more CommunityProject objects here...

  // Existing projects...

  CommunityProject(
    title: 'Educational Workshop Series',
    description:
        'Organize a series of workshops to provide valuable education to the community.',
    imageUrl: imagesConstruction[3],
    category: 'Education',
    progress: 30.0,
  ),

  CommunityProject(
    title: 'Neighborhood Cleanup Drive',
    description:
        'Engage volunteers in a neighborhood cleanup drive to improve cleanliness.',
    imageUrl: imagesConstruction[4],
    category: 'Environment',
    progress: 20.0,
  ),

  CommunityProject(
    title: 'Tech Skills Training Program',
    description:
        'Launch a program to teach tech skills to underprivileged youth in the community.',
    imageUrl: imagesConstruction[5],
    category: 'Education',
    progress: 10.0,
  ),

  CommunityProject(
    title: 'Food Drive for the Homeless',
    description:
        'Collect and distribute food to homeless individuals in the area.',
    imageUrl: imagesConstruction[6],
    category: 'Community Care',
    progress: 15.0,
  ),

  CommunityProject(
    title: 'Youth Arts Festival',
    description:
        'Organize a festival showcasing the artistic talents of local youth.',
    imageUrl: imagesConstruction[7],
    category: 'Art',
    progress: 5.0,
  ),
  // Existing projects...

  CommunityProject(
    title: 'Community Library Expansion',
    description:
        'Expand our community library to provide more books and resources.',
    imageUrl: imagesConstruction[8],
    category: 'Education',
    progress: 35.0,
  ),

  CommunityProject(
    title: 'Veterans Support Program',
    description:
        'Initiate a program to provide support and services to local veterans.',
    imageUrl: imagesConstruction[9],
    category: 'Community Care',
    progress: 25.0,
  ),

  CommunityProject(
    title: 'Youth Mentorship Program',
    description:
        'Establish a mentorship program to guide and inspire local youth.',
    imageUrl: imagesConstruction[10],
    category: 'Education',
    progress: 15.0,
  ),

  CommunityProject(
    title: 'Bike Sharing Initiative',
    description:
        'Launch a bike-sharing program to promote eco-friendly transportation.',
    imageUrl: imagesConstruction[11],
    category: 'Environment',
    progress: 8.0,
  ),

  CommunityProject(
    title: 'Cultural Diversity Festival',
    description:
        'Organize a festival celebrating the rich cultural diversity of our community.',
    imageUrl: imagesConstruction[12],
    category: 'Culture',
    progress: 12.0,
  ),
  CommunityProject(
    title: "Youth Coding Club",
    description:
        "Start a coding club for local youth to learn programming skills and technology literacy.",
    imageUrl: imagesConstruction[13],
    category: "Education",
    progress: 10.0,
  ),
  CommunityProject(
    title: "Senior Citizens Social Program",
    description:
        "Create a social program for senior citizens to combat isolation and provide companionship.",
    imageUrl: imagesUrlList[14],
    category: "Community",
    progress: 5.0,
  ),
  CommunityProject(
    title: "Green Roof Installation",
    description:
        "Install green roofs on community buildings to promote energy efficiency and green spaces.",
    imageUrl: imagesUrlList[15],
    category: "Green Initiatives",
    progress: 45.0,
  ),

  CommunityProject(
    title: "Neighborhood Clean-Up Initiative",
    description:
        "Organize regular neighborhood clean-up events to improve the overall cleanliness and appearance of the community.",
    imageUrl: imagesUrlList[16],
    category: "Environment",
    progress: 40.0,
  ),
  CommunityProject(
    title: "Youth Coding Club",
    description:
        "Start a coding club for local youth to learn programming skills and technology literacy.",
    imageUrl: imagesUrlList[17],
    category: "Education",
    progress: 10.0,
  ),
  CommunityProject(
    title: "Local History Museum Expansion",
    description:
        "Expand the local history museum to preserve and showcase our community's heritage.",
    imageUrl: imagesUrlList[18],
    category: "Culture",
    progress: 60.0,
  ),

  CommunityProject(
    title: "Elderly Care Center Renovation",
    description:
        "Renovate the local elderly care center to provide better facilities and care.",
    imageUrl: imagesUrlList[19],
    category: "Community Care",
    progress: 60.0,
  ),

  CommunityProject(
    title: "Educational Hub Project",
    description:
        "Establish an educational hub for after-school programs and tutoring.",
    imageUrl: imagesUrlList[20],
    category: "Education",
    progress: 30.0,
  ),

  CommunityProject(
    title: "Environmental Cleanup Initiative",
    description:
        "Organize a community-wide cleanup to enhance our environment.",
    imageUrl: imagesUrlList[21],
    category: "Environment",
    progress: 20.0,
  ),

  CommunityProject(
    title: "Food Drive for the Needy",
    description:
        "Organize a food drive to support families in need during the holidays.",
    imageUrl: imagesUrlList[22],
    category: "Community Care",
    progress: 15.0,
  ),

  CommunityProject(
    title: "Artistic Talent Showcase",
    description:
        "Host an event to showcase the artistic talents of local residents.",
    imageUrl: imagesUrlList[23],
    category: "Art",
    progress: 35.0,
  ),

// You can add more CommunityProject instances as needed.

// You can add more CommunityProject instances as needed.

  // Add more community projects here
];
