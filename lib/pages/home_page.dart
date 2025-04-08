import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Track the progress value
  double _progressValue = 0.5;

  // Update the progress value
  void _updateProgress(double value) {
    setState(() {
      _progressValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Progress Bar"),
        backgroundColor: Colors.red, // Red theme color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Displaying the current progress
              Text(
                'Progress: ${(_progressValue * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),

              // Progress Bar
              LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                minHeight: 8,
              ),
              const SizedBox(height: 40),

              // Slider to control the progress
              Slider(
                value: _progressValue,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                activeColor: Colors.red, // Red color for the slider
                inactiveColor: Colors.grey,
                onChanged: _updateProgress,
              ),
              const SizedBox(height: 20),

              // A button to reset the progress
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _progressValue = 0.0; // Reset progress to 0
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color matching the theme
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Reset Progress",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
