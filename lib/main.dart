import 'package:flutter/material.dart';
import 'connectionscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConnectionScreen(),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sensorData = "Loading...";
  double latitude = 37.7749;  // Default latitude (San Francisco)
  double longitude = -122.4194; // Default longitude (San Francisco)

  // Function to fetch latitude and longitude from ESP32
  Future<void> fetchLocation() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8080')); // Replace with your ESP32 IP and port
      if (response.statusCode == 200) {
        setState(() {
          // Assuming the response contains latitude and longitude in the format "lat: xx.x, lon: xx.x"
          // Update this parsing based on the actual format of your response
          var data = response.body.split(",");
          latitude = double.parse(data[0].split(":")[1].trim());
          longitude = double.parse(data[1].split(":")[1].trim());
          sensorData = "Latitude: $latitude, Longitude: $longitude";
        });
      } else {
        setState(() {
          sensorData = "Error: ${response.reasonPhrase} (${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        sensorData = "Request failed: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ESP32 Location on Map"),
      ),
      body: Column(
        children: [
          // Use Expanded to allow the map to take up available space
          Expanded(
            child: FlutterMap(
              children: [
                // TileLayer used as the base map
                TileLayer(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),

              ],
              mapController: MapController(),
              // Set the center and zoom level of the map

            ),
          ),
          ElevatedButton(
            onPressed: fetchLocation,
            child: const Icon(Icons.location_searching),
          ),
          SizedBox(height: 10),
          // Display the fetched coordinates or error
          Text(sensorData),
        ],
      ),
    );
  }
}
*/