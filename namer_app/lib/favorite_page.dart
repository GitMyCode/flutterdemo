import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: DisplayFavoriteGrid(favorites: appState.favorites),
    );
  }
}

class DisplayFavoriteGrid extends StatelessWidget {
  const DisplayFavoriteGrid({
    super.key,
    required this.favorites,
  });

  final List<WordPair> favorites;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
      childAspectRatio: 400 /80
      ),
      children: [
        for(var pair in favorites)
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  var appState = context.read<MyAppState>();
                  appState.toggleFavorite(pair);
                },
              ),
              title: Text(
                pair.asCamelCase,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ))
      ],
    );
  }

}

class DisplayFavorite extends StatelessWidget {
  const DisplayFavorite({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 10,
        ),
        itemCount: appState.favorites.length,
        itemBuilder: (context, index) {
          var favorite = appState.favorites[index];
          return Container(
            color: Colors.blue,
            child: Center(
              child: Text(favorite.asCamelCase),
            ),
          );
        },
      ),
    );
  }
}