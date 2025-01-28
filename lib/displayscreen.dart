import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final String ip;
  final String port;
  final List<Map<String, String>> dataList;

  DisplayScreen({
    required this.ip,
    required this.port,
    required this.dataList,
  });

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int currentIndex = 0;

  /// Updates to the next data after a delay of 3 seconds
  void goToNextLocation() async {
    await Future.delayed(Duration(seconds: 2)); // Add a 3-second delay
    setState(() {
      currentIndex = (currentIndex + 1) % widget.dataList.length;
    });
  }

  /// Updates to the previous data
  void goToPreviousLocation() async {
    await Future.delayed(Duration(seconds: 2)); // Add a 3-second delay
    setState(() {
      currentIndex = (currentIndex - 1 + widget.dataList.length) % widget.dataList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentData = widget.dataList[currentIndex];
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 227, 227, 1),
      appBar: AppBar(
        title: Text("Location and Description"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  currentData['image'] ?? 'assets/images/default.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Location:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                currentData['location'] ?? "No location available",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                currentData['description'] ?? "No description available",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: goToPreviousLocation,
                    child: Text("Previous"),
                  ),
                  ElevatedButton(
                    onPressed: goToNextLocation,
                    child: Text("Current"),
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
