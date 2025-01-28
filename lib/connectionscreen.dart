import 'package:flutter/material.dart';
import 'displayscreen.dart';

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  bool isConnected = false;

  void connectToESP() async {
    String ip = ipController.text;
    String port = portController.text;

    // IP address validation regex
    final ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])\.'
      r'(25[0-5]|2[0-4][0-9]|1[0-9]{1,2}|[1-9]?[0-9])$',
    );

    if (!ipRegex.hasMatch(ip)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid IP Address. Please enter a valid IP.")),
      );
      return;
    }

    if (port.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please provide a port number.")),
      );
      return;
    }

    // Simulate connection delay
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isConnected = true;
    });

    // Data list to pass to DisplayScreen
    List<Map<String, String>> dataList = [
      {
        "location": "Latitude: 0.0, Longitude: 0.0",
        "description": "World map",
        "image": "assets/images/5.jpg",
      },
      {
        "location": "Latitude: 26.5602, Longitude: 31.6956",
        "description": "Sohag, Egypt",
        "image": "assets/images/sohag.jpg",
      },
      {
        "location": "Latitude: 37.7749, Longitude: -122.4194",
        "description": "San Francisco, California",
        "image": "assets/images/2.jpg",
      },
      {
        "location": "Latitude: 40.7128, Longitude: -74.0060",
        "description": "New York City, New York",
        "image": "assets/images/3.jpg",
      },
      {
        "location": "Latitude: 34.0522, Longitude: -118.2437",
        "description": "Los Angeles, California",
        "image": "assets/images/4.jpg",
      },
      {
        "location": "Latitude: 48.8566, Longitude: 2.3522",
        "description": "Paris, France",
        "image": "assets/images/2.jpg",
      },
      {
        "location": "Latitude: 35.6895, Longitude: 139.6917",
        "description": "Tokyo, Japan",
        "image": "assets/images/3.jpg",
      },
      {
        "location": "Latitude: 51.5074, Longitude: -0.1278",
        "description": "London, England",
        "image": "assets/images/4.jpg",
      },

      // Add more items here...
    ];

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
      backgroundColor: Color.fromRGBO(235, 227, 227, 1),
      appBar: AppBar(
        title: Text(
          "Petroleum Spill Location",
          style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset("assets/images/face.png"))
              ,
              SizedBox(height: 20),
              TextField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: "ESP32 IP Address",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: portController,
                decoration: InputDecoration(
                  labelText: "ESP32 Port Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
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
