//main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thumper Time',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thumper Time!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildNavigationButton(context, 'Feeding Schedule', FeedingScheduleScreen()),
            _buildNavigationButton(context, 'Care Tips', CareTipsScreen()),
            _buildNavigationButton(context, 'Illness Symptoms', IllnessSymptomsScreen()),
            _buildNavigationButton(context, 'Reminders', RemindersScreen()),
            _buildNavigationButton(context, 'Favorites', FavoritesScreen()),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildNavigationButton(BuildContext context, String title, Widget destination) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.pink, // Pink background color for the button
      ),
      child: Text(title),
    );
  }
}

// Example of other screens with pink buttons

class FeedingScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feeding Schedule')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Select an age group to view the feeding schedule:'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle different age groups
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeGroupScheduleScreen(age: 'Baby')),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink, // Pink color for the button
              ),
              child: Text('Baby'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeGroupScheduleScreen(age: 'Adult')),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Adult'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeGroupScheduleScreen(age: 'Senior')),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Senior'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to home screen
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeGroupScheduleScreen extends StatelessWidget {
  final String age;

  AgeGroupScheduleScreen({required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$age Feeding Schedule')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Feeding schedule for $age bunny'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Feeding Schedule screen
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
