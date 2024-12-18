import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopularDestinationScreen extends StatefulWidget {
  final String title;
  final String location;
  final String date;
  final String description;
  final String price;
  final String time;
  final String imageAsset; // Local image asset
  final String mapImageAsset; // Map image asset

  const PopularDestinationScreen({
    Key? key,
    required this.title,
    required this.location,
    required this.date,
    required this.description,
    required this.price,
    required this.time,
    required this.imageAsset, // Local image for the destination
    required this.mapImageAsset, // Local image of the map
  }) : super(key: key);

  @override
  _PopularDestinationScreenState createState() => _PopularDestinationScreenState();
}

class _PopularDestinationScreenState extends State<PopularDestinationScreen> {
  bool _isFavorite = false; // Track whether the destination is a favorite

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite; // Toggle the favorite state
    });
  }

  /*void _share() {
    // Create the share message
    String shareMessage = "Check out this destination:\n"
        "${widget.title}\n"
        "Location: ${widget.location}\n"
        "Price: \$${widget.price}\n"
        "Description: ${widget.description}\n"
        "Date: ${widget.date}";

    Share.share(shareMessage); // Share the message
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border, // Change icon based on _isFavorite state
              color: _isFavorite ? Colors.red : null, // Change color to red if it's a favorite
            ),
            onPressed: _toggleFavorite, // Handle favorite action
          ),
          IconButton(
            icon: Icon(Icons.share), // Share icon
            onPressed: () {
              // Handle share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main image using local asset
            Stack(
              children: [
                Image.asset(widget.imageAsset, fit: BoxFit.cover, height: 250, width: double.infinity),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.location_on, color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Title and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.location,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Per person',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 16),

                  // Additional info
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(widget.location),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Open: ${widget.time}'),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),

            // Map section with an image
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.mapImageAsset), // Use the local map image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle booking action
                  Fluttertoast.showToast(
                    msg: "Book Completed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    'BOOK NOW',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}