import 'package:community_app/data_community_project.dart';
import 'package:flutter/material.dart';

class FundraisingPage extends StatelessWidget {
  final Fund data;
  const FundraisingPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fundraising and Donations'),
      ),
      body: ListView(
        children: [
          FundraisingCard(
            projectName: data.title,
            goalAmount: data.goalAmount,
            raisedAmount: data.raisedAmoint,
          ),

          // Add more FundraisingCard widgets for other projects
        ],
      ),
    );
  }
}

class FundraisingCard extends StatelessWidget {
  final String projectName;
  final double goalAmount;
  final double raisedAmount;

  FundraisingCard({
    super.key,
    required this.projectName,
    required this.goalAmount,
    required this.raisedAmount,
  });

  @override
  Widget build(BuildContext context) {
    double progress = raisedAmount / goalAmount;
    return Container(
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
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(projectName),
          ),
          LinearProgressIndicator(
            value: progress,
          ),
          ListTile(
            title: Text('Goal: \$${goalAmount.toStringAsFixed(2)}'),
            subtitle: Text('Raised: \$${raisedAmount.toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the donation payment process here
              // You can use third-party packages like stripe_payment or flutter_square
            },
            child: const Text('Donate'),
          ),
        ],
      ),
    );
  }
}
