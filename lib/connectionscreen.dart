import 'package:flutter/material.dart'; // Importing the Flutter Material package for UI components.
import 'displayscreen.dart'; // Importing a custom screen to display after connection.

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState(); // Creates the state for this stateful widget.
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  // Controllers for managing user input in the text fields.
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  // A boolean variable to track if the connection is established.
  bool isConnected = false;

  // Function to simulate connecting to an ESP32 device.
  void connectToESP() async {
    String ip = ipController.text; // Retrieve the entered IP address.
    String port = portController.text; // Retrieve the entered port number.

    // Regex pattern to validate the IP address format.
    final ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])$',
    );

    // Check if the IP address is invalid and display an error message if so.
    if (!ipRegex.hasMatch(ip)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid IP Address. Please enter a valid IP.")),
      );
      return; // Exit the function if the IP address is invalid.
    }

    // Check if the port is empty and display an error message if so.
    if (port.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please provide a port number.")),
      );
      return; // Exit the function if the port is empty.
    }

    // Simulate a delay to mimic a connection process.
    await Future.delayed(Duration(seconds: 1));

    // Update the state to mark the connection as established.
    setState(() {
      isConnected = true;
    });

    // Prepare a list of data to pass to the next screen.
    List<Map<String, String>> dataList = [
      {
        "location": "Latitude: 0.0, Longitude: 0.0",
        "description": "World map - No oil leak detected.",
        "oilLeakInfo": "No oil leak detected in this area.",
        "leakSize": "0 square meters",
        "image": "assets/images/5.jpg", // Image asset path.
      },
      {
        "location": "Latitude: 26.5602, Longitude: 31.6956",
        "description": "Sohag, Egypt - Minor oil leak detected.",
        "oilLeakInfo": "A minor oil leak has been detected near agricultural fields.",
        "leakSize": "50 square meters",
        "image": "assets/data/1.jpg",
      },
      {
        "location": "Latitude: 37.7749, Longitude: -122.4194",
        "description": "San Francisco, California - Moderate oil leak detected.",
        "oilLeakInfo": "A moderate oil leak has been detected near the coastline.",
        "leakSize": "200 square meters",
        "image": "assets/data/2.jpg",
      },
      {
        "location": "Latitude: 40.7128, Longitude: -74.0060",
        "description": "New York City, New York - Severe oil leak detected.",
        "oilLeakInfo": "A severe oil leak has been detected in the Hudson River.",
        "leakSize": "500 square meters",
        "image": "assets/data/3.jpg",
      },
      {
        "location": "Latitude: 34.0522, Longitude: -118.2437",
        "description": "Los Angeles, California - Critical oil leak detected.",
        "oilLeakInfo": "A critical oil leak has been detected near the port area.",
        "leakSize": "1000 square meters",
        "image": "assets/data/4.jpg",
      },
      {
        "location": "Latitude: 48.8566, Longitude: 2.3522",
        "description": "Paris, France - Minor oil leak detected.",
        "oilLeakInfo": "A minor oil leak has been detected near the Seine River.",
        "leakSize": "30 square meters",
        "image": "assets/data/5.jpg",
      },
      {
        "location": "Latitude: 35.6895, Longitude: 139.6917",
        "description": "Tokyo, Japan - Moderate oil leak detected.",
        "oilLeakInfo": "A moderate oil leak has been detected near the industrial zone.",
        "leakSize": "300 square meters",
        "image": "assets/data/6.jpg",
      },
    ];

    // Navigate to the DisplayScreen and pass the IP, port, and data list.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(ip: ip, port: port, dataList: dataList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 227, 227, 1), // Set the background color of the screen.
      appBar: AppBar(
        title: Text(
          "Petroleum Spill Location", // Title displayed on the app bar.
          style: TextStyle(),
        ),
        centerTitle: true, // Center the title on the app bar.
        backgroundColor: Colors.cyan, // Set the app bar's background color.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the body.
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill the width.
            children: [
              // Display an image at the top of the screen.
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset("assets/images/face.png")),
              SizedBox(height: 20), // Add spacing between elements.
              TextField(
                controller: ipController, // Bind this text field to the IP controller.
                decoration: InputDecoration(
                  labelText: "ESP32 IP Address", // Hint label for the text field.
                  border: OutlineInputBorder(), // Add a border around the text field.
                ),
                keyboardType: TextInputType.number, // Set the keyboard type to numbers.
              ),
              SizedBox(height: 10), // Add spacing between elements.
              TextField(
                controller: portController, // Bind this text field to the port controller.
                decoration: InputDecoration(
                  labelText: "ESP32 Port Number", // Hint label for the text field.
                  border: OutlineInputBorder(), // Add a border around the text field.
                ),
                keyboardType: TextInputType.number, // Set the keyboard type to numbers.
              ),
              SizedBox(height: 20), // Add spacing between elements.
              ElevatedButton(
                onPressed: connectToESP, // Call the connectToESP function when pressed.
                child: Text("Connect"), // Button label.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
