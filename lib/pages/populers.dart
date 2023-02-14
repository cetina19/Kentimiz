import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nav_tab/drawers.dart';

String A =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut aliquet ligula. ";

class Populers extends StatefulWidget {
  const Populers({Key? key}) : super(key: key);

  @override
  State<Populers> createState() => _PopulersState();
}

class _PopulersState extends State<Populers> {
  final ScrollController _scrollController = ScrollController();
  List<Card> items = [];
  bool loading = false, allLoaded = false;
  bool isCollapsed = false;

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<Card> newData =
        items.length >= 60 ? [] : List.generate(20, (index) => Example());
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideDrawer(),
      backgroundColor: Colors.white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: LayoutBuilder(builder: (context, constraints) {
        if (items.isNotEmpty) {
          return Stack(
            children: [
              ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      return ListTile(title: Example() //items.first,
                          );
                    } else {
                      return Container(
                          width: constraints.maxWidth,
                          height: 30,
                          child: Text("Please Refresh The Page",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)));
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: items.length + (allLoaded ? 1 : 0)),
              if (loading) ...[
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              ]
            ],
          );
        } else {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      }),
    );
  }

  Widget getAppBar() {
    return AppBar(
        elevation: 4,
        backgroundColor: Colors.lightBlue,
        title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Populer Posts",
                ),
              ],
            )));
  }

  Card Example() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Color.fromRGBO(255, 193, 7, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.purple.shade100],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/example_1.png',
                            fit: BoxFit.fitHeight,
                          ))
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [Expanded(flex: 1, child: Text(A))],
                  ),
                )
              ],
            )),
      ),
    );
  }
}










/*Widget getBody(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  shadowColor: Color.fromRGBO(255, 193, 7, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height/7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.lightBlue,Colors.green],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft
                        )
                      ),
                      child: Row(
                        
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:  Image.asset('assets/images/example_1.png', 
                                  fit: BoxFit.fitHeight,)
                                )
                              ],
                            ),
                          ),
                          SizedBox(width:8),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Text(A)
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  } */



/*import 'package:flutter/material.dart';
import 'package:nav_tab/main.dart';
import 'package:english_words/english_words.dart';

Set<String> Words = {a,b,c,d,e};

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
}

class Favorites extends StatefulWidget{
  @override
  Favorites_state createState() => Favorites_state();
}

class Favorites_state extends State<Favorites>{
  bool tapControl = false;

  Widget listBuilt(){
    return ListView.builder(
      itemBuilder: (context, item){

      },
    )
    /*return ListView.builder(
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
    */
  }

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
            child: tapControl ? Text(a) : Text("Hey"),
          )
        )
      ),
    );
  }
}*/