import 'package:flutter/material.dart';
import 'displayscreen.dart'; // Importing the DisplayScreen for navigation after connecting

// This is the main widget for the ConnectionScreen
class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

// State class for ConnectionScreen
class _ConnectionScreenState extends State<ConnectionScreen> {
  // Controllers for the input fields to get IP and port number
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  bool isConnected = false; // Tracks whether the connection is successful

  // Function to handle the connection logic
  void connectToESP() async {
    String ip = ipController.text; // Get the entered IP address
    String port = portController.text; // Get the entered port number

    // Regular expression to validate the IP address format
    final ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.' // First octet
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.' // Second octet
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.' // Third octet
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])$', // Fourth octet
    );

    // Validate the IP address format
    if (!ipRegex.hasMatch(ip)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid IP Address. Please enter a valid IP.")),
      );
      return;
    }

    // Check if the port is provided
    if (port.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please provide a port number.")),
      );
      return;
    }

    // Simulate a connection delay to mimic real-world behavior
    await Future.delayed(Duration(seconds: 1));

    // Update the connection status to true
    setState(() {
      isConnected = true;
    });

    // Sample data list to simulate data after connection
    List<Map<String, String>> dataList = [
      // Sample oil leak locations with details
      {
        "location": "Latitude: 0.0, Longitude: 0.0",
        "description": "World map - No oil leak detected.",
        "oilLeakInfo": "No oil leak detected in this area.",
        "leakSize": "0 square meters",
        "image": "assets/images/5.jpg",
      },
      {
        "location": "Latitude: 26.5602, Longitude: 31.6956",
        "description": "Sohag, Egypt - Minor oil leak detected.",
        "oilLeakInfo": "A minor oil leak has been detected near agricultural fields.",
        "leakSize": "50 square meters",
        "image": "assets/data/1.jpg",
      },
      // Additional data entries...
    ];

    // Navigate to DisplayScreen and pass IP, port, and data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(ip: ip, port: port, dataList: dataList),
      ),
    );
  }

  // Build method to construct the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 227, 227, 1), // Background color
      appBar: AppBar(
        title: Text(
          "Petroleum Spill Location", // App bar title
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan, // App bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the UI
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch elements to fill width
            children: [
              // Image widget to display an asset image
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset("assets/images/face.png"),
              ),
              SizedBox(height: 20), // Spacing
              // TextField for entering the IP address
              TextField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: "ESP32 IP Address",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Numeric input
              ),
              SizedBox(height: 10), // Spacing
              // TextField for entering the port number
              TextField(
                controller: portController,
                decoration: InputDecoration(
                  labelText: "ESP32 Port Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Numeric input
              ),
              SizedBox(height: 20), // Spacing
              // ElevatedButton to trigger the connection
              ElevatedButton(
                onPressed: connectToESP,
                child: Text("Connect"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
