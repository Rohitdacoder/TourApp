import 'package:flutter/material.dart';
import 'popular_destination_screen.dart';
import 'CategoryDetailsScreen.dart';

// Explore Screen Class
class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for a destination",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 16),
            // Category Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Categorybutton(label: "Sights"),
                Categorybutton(label: "Tour"),
                Categorybutton(label: "Adventure"),
              ],
            ),
            SizedBox(height: 16),
            // Sight Cards
            Expanded(
              child: ListView(
                children: [
                  SightCard(
                    imageAsset: 'asset/mount.jpg',
                    title: 'Mount Bromo',
                    location: 'Indonesia',
                    rating: 4.6,
                  ),
                  SizedBox(height: 10),
                  SightCard(
                    imageAsset: 'asset/colosseum-in-rome-3.jpg',
                    title: 'Colosseum',
                    location: 'Rome, Italy',
                    rating: 4.8,
                  ),
                  // Add more sight cards as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            // Popular Destinations Section
            Text(
              "Popular",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                PopularDestinationCard(
                  title: 'Colosseum',
                  date: '25 March - 29 March, 2022',
                  description: 'A historical monument in Rome...',
                  price: '50',
                  location: 'Rome, Italy',
                  time: '09:00 AM',
                  imageAsset: 'asset/colosseum-in-rome-3.jpg',
                  mapImageAsset: 'asset/colomap.png',
                ),
                PopularDestinationCard(
                  title: 'Mount Bromo',
                  date: '05 April - 12 April, 2022',
                  description: 'Active volcano with a stunning view...',
                  price: '75',
                  location: 'East Java, Indonesia',
                  time: '06:00 AM',
                  imageAsset: 'asset/mount.jpg',
                  mapImageAsset: 'asset/mountss.png',
                ),
                PopularDestinationCard(
                  title: 'Gundam Statue',
                  date: '09 April - 12 April, 2022',
                  description: 'Life-size Gundam statue in Tokyo...',
                  price: '30',
                  location: 'Odaiba, Tokyo',
                  time: '10:00 AM',
                  imageAsset: 'asset/gau.jpg',
                  mapImageAsset: 'asset/gaumap.png',
                ),
                // More popular destinations can be added here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Category Button Widget
class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(label),
    );
  }
}

// Sight Card Widget
class SightCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String location;
  final double rating;

  const SightCard({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.location,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(imageAsset, height: 250, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              location,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rating: $rating', style: TextStyle(color: Colors.blue)),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Popular Destination Card Widget
class PopularDestinationCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String price;
  final String location;
  final String time;
  final String imageAsset;
  final String mapImageAsset;

  const PopularDestinationCard({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
    required this.price,
    required this.location,
    required this.time,
    required this.imageAsset,
    required this.mapImageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(location),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the popular destination details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopularDestinationScreen(
                title: title,
                location: location,
                date: date,
                description: description,
                price: price,
                time: time,
                imageAsset: imageAsset,
                mapImageAsset: mapImageAsset,
              ),
            ),
          );
        },
        leading: Image.asset(imageAsset, width: 100, height: 100, fit: BoxFit.cover),
      ),
    );
  }
}


class Categorybutton extends StatelessWidget {
  final String label;

  const Categorybutton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigate to the CategoryDetailsScreen with the selected category
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsScreen(category: label),
          ),
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(label),
    );
  }
}