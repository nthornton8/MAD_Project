//reminders.dart

class RemindersScreen extends StatefulWidget {
  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  List<String> reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminders')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reminders[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _addReminder(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Add Reminder'),
            ),
          ),
        ],
      ),
    );
  }

  void _addReminder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Reminder'),
        content: TextField(
          onSubmitted: (value) {
            setState(() {
              reminders.add(value);
            });
            Navigator.pop(context); // Close the dialog
          },
          decoration: InputDecoration(hintText: 'Enter reminder text'),
        ),
      ),
    );
  }
}