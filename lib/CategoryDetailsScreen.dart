import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String category;

  const CategoryDetailsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.blueAccent,
      ),
      body: _getCategoryContent(),
    );
  }

  Widget _getCategoryContent() {
    switch (category) {
      case "Sights":
        return _buildSightsList();
      case "Tour":
        return _buildTourTimetable();
      case "Adventure":
        return _buildAdventureActivities();
      default:
        return Center(child: Text("No content available"));
    }
  }

  Widget _buildSightsList() {
    // Sample list of sights
    final sights = [
      "Eiffel Tower",
      "Great Wall of China",
      "Machu Picchu",
      "Statue of Liberty",
      "Pyramids of Giza",
    ];

    return ListView.builder(
      itemCount: sights.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(sights[index]),
        );
      },
    );
  }

  Widget _buildTourTimetable() {
    // Sample timetable for tours
    final tours = [
      "City Tour: 9 AM - 5 PM",
      "Historical Tour: 10 AM - 4 PM",
      "Night Tour: 6 PM - 10 PM",
    ];

    return ListView.builder(
      itemCount: tours.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tours[index]),
        );
      },
    );
  }

  Widget _buildAdventureActivities() {
    // Sample list of adventure activities
    final activities = [
      "Hiking",
      "Bungee Jumping",
      "Skydiving",
      "Rock Climbing",
      "Scuba Diving",
    ];

    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(activities[index]),
        );
      },
    );
  }
}