import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final String ip; // IP address of the ESP32
  final String port; // Port number of the ESP32
  final List<Map<String, String>> dataList; // List of data containing location, description, and image

  DisplayScreen({
    required this.ip,
    required this.port,
    required this.dataList,
  });

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int currentIndex = 0; // Tracks the current index of the data being displayed
  bool isLoading = false; // Tracks whether the app is in a loading state

  /// Function to navigate to the next location in the data list
  void goToNextLocation() async {
    setState(() {
      isLoading = true; // Start loading animation
    });

    await Future.delayed(Duration(seconds: 3)); // Simulate a 3-second delay for loading

    setState(() {
      currentIndex = (currentIndex + 1) % widget.dataList.length; // Move to the next item in the list
      isLoading = false; // Stop loading animation
    });
  }

  /// Function to navigate to the previous location in the data list
  void goToPreviousLocation() async {
    setState(() {
      isLoading = true; // Start loading animation
    });

    await Future.delayed(Duration(seconds: 3)); // Simulate a 3-second delay for loading

    setState(() {
      currentIndex = (currentIndex - 1 + widget.dataList.length) % widget.dataList.length; // Move to the previous item in the list
      isLoading = false; // Stop loading animation
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentData = widget.dataList[currentIndex]; // Get the current data item based on the index
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 227, 227, 1), // Set background color
      appBar: AppBar(
        title: Text("Location and Description"), // App bar title
        centerTitle: true, // Center the title
        backgroundColor: Colors.cyan, // App bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the body content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
            children: [
              // Display loading animation or image based on the state
              isLoading
                  ? Center(
                child: CircularProgressIndicator(), // Show loading spinner
              )
                  : Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  currentData['image'] ?? 'assets/images/default.jpg', // Display image from the current data
                  fit: BoxFit.fill, // Fill the container with the image
                ),
              ),
              SizedBox(height: 20), // Add vertical spacing
              // Display location and description only when not loading
              if (!isLoading) ...[
                Text(
                  "Location:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Style for the location label
                ),
                Text(
                  currentData['location'] ?? "No location available", // Display location from the current data
                  style: TextStyle(fontSize: 16), // Style for the location text
                ),
                SizedBox(height: 15), // Add vertical spacing
                Text(
                  "Description:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Style for the description label
                ),
                Text(
                  currentData['description'] ?? "No description available", // Display description from the current data
                  style: TextStyle(fontSize: 16), // Style for the description text
                ),
                SizedBox(height: 15), // Add vertical spacing
                Text(
                  "Oil Leak Information:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Style for the oil leak info label
                ),
                Text(
                  currentData['oilLeakInfo'] ?? "No oil leak information available", // Display oil leak info from the current data
                  style: TextStyle(fontSize: 16), // Style for the oil leak info text
                ),
                SizedBox(height: 15), // Add vertical spacing
                Text(
                  "Leak Size:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Style for the leak size label
                ),
                Text(
                  currentData['leakSize'] ?? "No leak size available", // Display leak size from the current data
                  style: TextStyle(fontSize: 16), // Style for the leak size text
                ),
              ],
              SizedBox(height: 80), // Add vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space buttons evenly
                children: [
                  // Hide "Previous" button on the first item
                  if (currentIndex > 0)
                    ElevatedButton(
                      onPressed: goToPreviousLocation, // Navigate to the previous location
                      child: Text("Previous"), // Button text
                    ),
                  // Add a spacer if "Previous" button is hidden
                  if (currentIndex == 0) Spacer(),
                  // Change "Current" button text to "Get Data"
                  ElevatedButton(
                    onPressed: goToNextLocation, // Navigate to the next location
                    child: Text("Get Data"), // Button text
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}