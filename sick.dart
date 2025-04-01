//sick.dart

class IllnessSymptomsScreen extends StatefulWidget {
  @override
  _IllnessSymptomsScreenState createState() => _IllnessSymptomsScreenState();
}

class _IllnessSymptomsScreenState extends State<IllnessSymptomsScreen> {
  bool hasLossOfAppetite = false;
  bool hasLethargy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Illness Symptoms')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Select symptoms your bunny is experiencing:'),
            CheckboxListTile(
              title: Text('Loss of appetite'),
              value: hasLossOfAppetite,
              onChanged: (bool? value) {
                setState(() {
                  hasLossOfAppetite = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Lethargy'),
              value: hasLethargy,
              onChanged: (bool? value) {
                setState(() {
                  hasLethargy = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDiagnosis(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Get Diagnosis'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Home screen
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

  void _showDiagnosis(BuildContext context) {
    String diagnosis = '';
    if (hasLossOfAppetite && hasLethargy) {
      diagnosis = 'Possible illness: Gastric Stasis. Treatment: Seek a vet immediately!';
    } else {
      diagnosis = 'No serious illness detected. Monitor your bunny’s condition.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Diagnosis'),
        content: Text(diagnosis),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the pop-up
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}