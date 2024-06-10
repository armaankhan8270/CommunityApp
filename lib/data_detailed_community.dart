import 'package:community_app/data_community_project.dart';
import 'package:community_app/imageurl.dart';

class DetailedCommunityProject extends CommunityProject {
  final String location;
  final double estimatedCost;
  final String timeline;
  final List<String> comments;
  final List<String> discussions;
  bool isFollowed;
  int votes;
  double donationAmount;

  DetailedCommunityProject({
    required String title,
    required String description,
    required String imageUrl,
    required String category,
    required double progress,
    required this.location,
    required this.estimatedCost,
    required this.timeline,
    required this.comments,
    required this.discussions,
    this.isFollowed = false,
    this.votes = 0,
    this.donationAmount = 0.0,
  }) : super(
          title: title,
          description: description,
          imageUrl: imageUrl,
          category: category,
          progress: progress,
        );
}

List<DetailedCommunityProject> detailedProjects = [];

List<DetailedCommunityProject> communityProjects = [
  DetailedCommunityProject(
    title: 'Community Garden Expansion',
    description:
        'Expand our community garden to grow more fresh produce for local residents.',
    imageUrl: imagesConstruction[0],
    category: 'Gardening',
    progress: 45.0,
    location: 'Community Garden Area',
    estimatedCost: 5000.0,
    timeline: '6 months',
    comments: ['Great project!', 'I love gardening.'],
    discussions: ['How can we get more volunteers?'],
  ),
  DetailedCommunityProject(
    title: 'Youth Sports Program',
    description:
        'Start a youth sports program to promote physical activity and teamwork among local children.',
    imageUrl: imagesConstruction[1],
    category: 'Sports',
    progress: 40.0,
    location: 'Local Sports Complex',
    estimatedCost: 10000.0,
    timeline: '8 months',
    comments: ["I used to be a coach and can volunteer my time."],
    discussions: ["Let's discuss the sports activities."],
  ),
  DetailedCommunityProject(
    title: 'Elderly Care Center Renovation',
    description:
        'Renovate the local elderly care center to provide better facilities and care.',
    imageUrl: imagesConstruction[2],
    category: 'Community Care',
    progress: 60.0,
    location: 'Elderly Care Center',
    estimatedCost: 15000.0,
    timeline: '10 months',
    comments: [
      "I can donate furniture for the center.",
      "We need more nursing staff."
    ],
    discussions: ["Let's discuss the renovation plans."],
  ),
  DetailedCommunityProject(
    title: 'Educational Workshop Series',
    description:
        'Organize a series of workshops to provide valuable education to the community.',
    imageUrl: imagesConstruction[3],
    category: 'Education',
    progress: 30.0,
    location: 'Community Center',
    estimatedCost: 5000.0,
    timeline: '4 months',
    comments: ["I can volunteer as a workshop facilitator."],
    discussions: ["Let's plan the workshop topics and schedule."],
  ),
  DetailedCommunityProject(
    title: 'Neighborhood Cleanup Drive',
    description:
        'Engage volunteers in a neighborhood cleanup drive to improve cleanliness.',
    imageUrl: imagesConstruction[4],
    category: 'Environment',
    progress: 20.0,
    location: 'Various Locations',
    estimatedCost: 2000.0,
    timeline: '3 months',
    comments: [
      "I have trash bags and gloves to donate.",
      "Let's involve local schools."
    ],
    discussions: ["Let's plan the cleanup schedule."],
  ),
  //
  // Existing community projects...

  // Sample data for DetailedCommunityProject instances

  DetailedCommunityProject(
    title: 'Tech Skills Training Program',
    description:
        'Launch a program to teach tech skills to underprivileged youth in the community.',
    imageUrl: imagesConstruction[5],
    category: 'Education',
    progress: 10.0,
    location: 'Community Center',
    estimatedCost: 5000.0,
    timeline: '6 months',
    comments: ['Great initiative!', 'How can I volunteer?'],
    discussions: ['Meeting on Monday at 3 PM'],
  ),
  DetailedCommunityProject(
    title: 'Food Drive for the Homeless',
    description:
        'Collect and distribute food to homeless individuals in the area.',
    imageUrl: imagesConstruction[6],
    category: 'Community Care',
    progress: 15.0,
    location: 'Downtown Park',
    estimatedCost: 1000.0,
    timeline: '3 months',
    comments: ["Let's gather non-perishable food items."],
    discussions: ['Meeting on Wednesday at 2 PM'],
  ),
  DetailedCommunityProject(
    title: 'Youth Arts Festival',
    description:
        'Organize a festival showcasing the artistic talents of local youth.',
    imageUrl: imagesConstruction[7],
    category: 'Art',
    progress: 5.0,
    location: 'Community Arts Center',
    estimatedCost: 3000.0,
    timeline: '4 months',
    comments: ['Looking for local young artists to participate.'],
    discussions: ['Meeting on Thursday at 4 PM'],
  ),
  DetailedCommunityProject(
    title: "Community Library Expansion",
    description:
        "Expand our community library to provide more books and resources.",
    imageUrl: imagesConstruction[8],
    category: "Education",
    progress: 35.0,
    location: "Main Street Library",
    estimatedCost: 8000.0,
    timeline: "12 months",
    comments: ["We need volunteers for book sorting."],
    discussions: ["Meeting on Friday at 10 AM"],
  ),

  DetailedCommunityProject(
    title: "Veterans Support Program",
    description:
        "Initiate a program to provide support and services to local veterans.",
    imageUrl: imagesConstruction[9],
    category: "Community Care",
    progress: 25.0,
    location: "Veterans Center",
    estimatedCost: 6000.0,
    timeline: "9 months",
    comments: ["Let's create a list of needed services."],
    discussions: ["Meeting on Saturday at 1 PM"],
  ),

  DetailedCommunityProject(
    title: "Youth Mentorship Program",
    description:
        "Establish a mentorship program to guide and inspire local youth.",
    imageUrl: imagesConstruction[10],
    category: "Education",
    progress: 15.0,
    location: "Community Youth Center",
    estimatedCost: 4000.0,
    timeline: "6 months",
    comments: ["We need experienced mentors."],
    discussions: ["Meeting on Tuesday at 5 PM"],
  ),

  DetailedCommunityProject(
    title: "Bike Sharing Initiative",
    description:
        "Launch a bike-sharing program to promote eco-friendly transportation.",
    imageUrl: imagesConstruction[11],
    category: "Environment",
    progress: 8.0,
    location: "Various Locations",
    estimatedCost: 2500.0,
    timeline: "5 months",
    comments: ["Donations needed for bike purchase."],
    discussions: ["Meeting on Monday at 2 PM"],
  ),

  DetailedCommunityProject(
    title: "Cultural Diversity Festival",
    description:
        "Organize a festival celebrating the rich cultural diversity of our community.",
    imageUrl: imagesConstruction[12],
    category: "Culture",
    progress: 12.0,
    location: "City Park",
    estimatedCost: 3500.0,
    timeline: "7 months",
    comments: ["Let's create a list of cultural performances."],
    discussions: ["Meeting on Wednesday at 3 PM"],
  ),

  DetailedCommunityProject(
    title: 'Youth Coding Club',
    description:
        'Start a coding club for local youth to learn programming skills and technology literacy.',
    imageUrl: imagesConstruction[13],
    category: 'Education',
    progress: 10.0,
    location: 'Community Center',
    estimatedCost: 3000.0,
    timeline: '12 months',
    comments: ["I'm a software developer and can mentor young coders."],
    discussions: ["Let's decide on the programming languages to teach."],
  ),
  DetailedCommunityProject(
    title: 'Senior Citizens Social Program',
    description:
        'Create a social program for senior citizens to combat isolation and provide companionship.',
    imageUrl: imagesUrlList[14],
    category: 'Community',
    progress: 5.0,
    location: 'Senior Center',
    estimatedCost: 500.0,
    timeline: '10 months',
    comments: ["I have experience with senior care and can volunteer."],
    discussions: ["Let's plan the activities and schedule for seniors."],
  ),
  DetailedCommunityProject(
    title: 'Green Roof Installation',
    description:
        'Install green roofs on community buildings to promote energy efficiency and green spaces.',
    imageUrl: imagesUrlList[15],
    category: 'Green Initiatives',
    progress: 45.0,
    location: 'Various Buildings',
    estimatedCost: 6000.0,
    timeline: '6 months',
    comments: [
      "Green roofs can reduce energy bills.",
      "We need volunteers for planting."
    ],
    discussions: ["Let's identify suitable buildings for installation."],
  ),

  DetailedCommunityProject(
    title: 'Neighborhood Clean-Up Initiative',
    description:
        'Organize regular neighborhood clean-up events to improve the overall cleanliness and appearance of the community.',
    imageUrl: imagesUrlList[16],
    category: 'Environment',
    progress: 40.0,
    location: 'Various Locations',
    estimatedCost: 2000.0,
    timeline: '6 months',
    comments: ["Let's work together to keep our neighborhood clean."],
    discussions: ["Let's plan the clean-up schedule and supplies."],
  ),
  DetailedCommunityProject(
    title: 'Youth Coding Club',
    description:
        'Start a coding club for local youth to learn programming skills and technology literacy.',
    imageUrl: imagesUrlList[17],
    category: 'Education',
    progress: 10.0,
    location: 'Community Center',
    estimatedCost: 3000.0,
    timeline: '12 months',
    comments: ["I'm a software developer and can mentor young coders."],
    discussions: ["Let's decide on the programming languages to teach."],
  ),

  DetailedCommunityProject(
    title: 'Local History Museum Expansion',
    description:
        'Expand the local history museum to preserve and showcase our community\'s heritage.',
    imageUrl: imagesUrlList[18],
    category: 'Culture',
    progress: 60.0,
    location: 'History Museum',
    estimatedCost: 10000.0,
    timeline: '8 months',
    comments: [
      "I have historical artifacts to donate.",
      "We need more exhibit space."
    ],
    discussions: ["Let's plan the expansion layout."],
  ),

  DetailedCommunityProject(
    title: 'Elderly Care Center Renovation',
    description:
        'Renovate the local elderly care center to provide better facilities and care.',
    imageUrl: imagesUrlList[19],
    category: 'Community Care',
    progress: 60.0,
    location: 'Elderly Care Center',
    estimatedCost: 15000.0,
    timeline: '10 months',
    comments: [
      "I can donate furniture for the center.",
      "We need more nursing staff."
    ],
    discussions: ["Lzet's discuss the renovation plans."],
  ),

  DetailedCommunityProject(
    title: 'Educational Hub Project',
    description:
        'Establish an educational hub for after-school programs and tutoring.',
    imageUrl: imagesUrlList[20],
    category: 'Education',
    progress: 30.0,
    location: 'Community Center',
    estimatedCost: 9000.0,
    timeline: '5 months',
    comments: ["I can volunteer as a tutor.", "We need computers for the hub."],
    discussions: ["Let's plan the educational programs."],
  ),

  DetailedCommunityProject(
    title: 'Environmental Cleanup Initiative',
    description:
        'Organize a community-wide cleanup to enhance our environment.',
    imageUrl: imagesUrlList[21],
    category: 'Environment',
    progress: 20.0,
    location: 'Various Locations',
    estimatedCost: 2000.0,
    timeline: '3 months',
    comments: [
      "I have trash bags and gloves to donate.",
      "Let's involve local schools."
    ],
    discussions: ["Let's plan the cleanup schedule."],
  ),

  DetailedCommunityProject(
    title: 'Food Drive for the Needy',
    description:
        'Organize a food drive to support families in need during the holidays.',
    imageUrl: imagesUrlList[22],
    category: 'Community Care',
    progress: 15.0,
    location: 'Community Hall',
    estimatedCost: 1500.0,
    timeline: '2 months',
    comments: [
      "I can volunteer to collect donations.",
      "Let's create a list of needed food items."
    ],
    discussions: ["Let's organize a donation drop-off event."],
  ),

  DetailedCommunityProject(
    title: 'Artistic Talent Showcase',
    description:
        'Host an event to showcase the artistic talents of local residents.',
    imageUrl: imagesUrlList[23],
    category: 'Art',
    progress: 35.0,
    location: 'Community Arts Center',
    estimatedCost: 3000.0,
    timeline: '4 months',
    comments: [
      "I'm an artist and want to participate.",
      "We need a stage and art supplies."
    ],
    discussions: ["Let's plan the event program."],
  ),

  // Add more detailed projects here
];
