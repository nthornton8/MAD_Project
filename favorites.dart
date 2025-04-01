//favorites.dart

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favorites[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _addFavorite(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('Add to Favorites'),
            ),
          ),
        ],
      ),
    );
  }

  void _addFavorite(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add to Favorites'),
        content: TextField(
          onSubmitted: (value) {
            setState(() {
              favorites.add(value);
            });
            Navigator.pop(context); // Close the dialog
          },
          decoration: InputDecoration(hintText: 'Enter favorite item'),
        ),
      ),
    );
  }
}