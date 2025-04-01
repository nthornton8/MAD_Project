//feeding.dart

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
              child: Text('Baby'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeGroupScheduleScreen(age: 'Adult')),
                );
              },
              child: Text('Adult'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeGroupScheduleScreen(age: 'Senior')),
                );
              },
              child: Text('Senior'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to home screen
              },
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
            // You can display specific feeding times here based on the age.
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Feeding Schedule screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
