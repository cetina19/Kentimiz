import 'package:flutter/material.dart';
import 'package:nav_tab/main.dart';
/*import 'package:flutter/english_words/english_words.dart';

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
  Widget _buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider();

        final index = item ~/ 2;

        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
    trailing: Icon(alreadySaved ? Icons.favorite : 
    Icons.favorite_border, color: alreadySaved ?
    Colors.red : null),
    onTap: (){
      setState(() {
        if (alreadySaved){
          _savedWordPairs.remove(pair);
        } else {
          _savedWordPairs.add(pair);
        }
      });
    },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = 
          _savedWordPairs.map((WordPair pair) {
            return ListTile(title: Text(pair.asPascalCase,
            style: TextStyle(fontSize: 16.0))
            );
          });

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved WordPairs')
              ),
              body: ListView(children: divided)
            );
        }
      )
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        backgroundColor: Colors.purple[900],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ]
      ),
      body: _buildList()
    );
  }
}*/

class Favorites extends StatefulWidget{
  @override
  Favorites_state createState() => Favorites_state();
}

class Favorites_state extends State<Favorites>{
  bool tapControl = false;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: (){
            setState((){
              tapControl = !tapControl;
            });
          },
          child: Container(
            child: tapControl ? Text(a+b) : Text(c+d+e),
          )
        )
      ),
    );
  }
}