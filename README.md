# Petroleum Spill Location Tracker

This Flutter application is designed to track and display petroleum spill locations and related information. It connects to an ESP32 device via IP address and port, retrieves data, and displays it in a user-friendly interface. The app includes features like IP validation, loading animations, and a list of locations with oil leak details.

---

## Features

- **ESP32 Connection**: Connect to an ESP32 device by entering its IP address and port number.
- **IP Validation**: Validate the IP address format before connecting.
- **Loading Animation**: Display a loading animation while fetching data.
- **Oil Leak Information**: View detailed information about oil leaks, including location, description, leak size, and images.
- **Navigation**: Navigate between different locations using "Previous" and "Get Data" buttons.
- **Responsive UI**: A clean and responsive user interface built with Flutter.

---

## Screenshots

| Connection Screen | Display Screen |
|-------------------|----------------|
| ![studio64_sA2T8EyV91](https://github.com/user-attachments/assets/19a5a6f1-e387-48a7-84d1-2ca305094c71) |![studio64_zGkr3zUggf](https://github.com/user-attachments/assets/9b0f2c9b-b149-4d87-8518-aaf317e1792a)|

---

## Getting Started

### Prerequisites

- **Flutter SDK**: Make sure you have Flutter installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
- **ESP32 Device**: Ensure your ESP32 is configured and connected to the same network as your development machine or mobile device.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/petroleum-spill-location-tracker.git
   cd petroleum-spill-location-tracker
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

---

## Usage

1. **Enter ESP32 IP and Port**:
   - Open the app and enter the IP address and port number of your ESP32 device.
   - Click the "Connect" button to establish a connection.

2. **View Oil Leak Information**:
   - Once connected, the app will display a list of locations with oil leak details.
   - Use the "Previous" and "Get Data" buttons to navigate between locations.

3. **Explore Details**:
   - Each location displays:
     - **Location**: Latitude and longitude.
     - **Description**: Brief description of the location.
     - **Oil Leak Information**: Details about the oil leak.
     - **Leak Size**: Size of the oil leak in square meters.
     - **Image**: Visual representation of the location.

---

## Project Structure

```
petroleum-spill-location-tracker/
├── lib/
│   ├── main.dart                # Entry point of the application
│   ├── connectionscreen.dart    # Screen for connecting to ESP32
│   ├── displayscreen.dart       # Screen for displaying oil leak information
│   └── widgets/                 # Custom widgets (if any)
├── assets/
│   ├── images/                  # Static images used in the app
│   └── data/                    # Data files (e.g., JSON, images)
├── pubspec.yaml                 # Flutter dependencies and asset configuration
└── README.md                    # Project documentation
```

---

## Dependencies

This project uses the following Flutter packages:

- **flutter/material.dart**: For building the UI.
- **No external packages**: The app is built using Flutter's core libraries.

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- **Flutter Team**: For building an amazing framework for cross-platform development.
- **ESP32 Community**: For providing resources and support for ESP32 development.

---

## Contact

For questions or feedback, feel free to reach out:

- **Your Name**: [Your Email](Eng.Bashar.Taha@gmail.com)
- **GitHub**: [Your GitHub Profile][(https://github.com/your-username](https://github.com/BasharTaha06))

---

This README provides a comprehensive overview of your project. You can customize it further to suit your needs. Let me know if you need additional sections or modifications! 🚀
