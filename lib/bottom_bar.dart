import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: 1,
        onTap: (index){},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          )
        ],
      ),
    );
  }
}