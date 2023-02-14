import 'package:flutter/material.dart';
import 'package:nav_tab/main.dart';

Set<String> words = {a,b,c,d,e};

class News extends StatefulWidget{
  @override
  News_state createState() => News_state();
}

class News_state extends State<News>{
  bool tapControl = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _postListview()
    );
  }

  Widget _postRow() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.redAccent
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(),
              //child: CachedNetworkImage()
              ),
          ),
        ),
        Text(
          'Hello',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ]
    );
  }

  Widget _postImage(){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/example_1.png',
              fit: BoxFit.cover),
          ],
        )
      )
    );
  }

  Widget _postCaption(){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4
      ),
      child: Text(a+b+c),
    );
  }

  Widget _postView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //_postRow(),_postCaption()
        _postImage()
      ],
    );
  }

  Widget _postListview(){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
        return _postView();
      },
    );
  }
}