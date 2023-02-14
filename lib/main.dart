import 'dart:developer';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_tab/drawers.dart';
import 'package:nav_tab/pages/favorites.dart';
//import 'package:nav_tab/pages/favorites.dart';
import 'package:nav_tab/pages/news.dart';
import 'package:nav_tab/bottom_bar.dart';
import 'package:nav_tab/pages/populers.dart';
import 'package:nav_tab/pages/notifications.dart';
import 'package:nav_tab/newPost.dart';
import 'package:nav_tab/profilePage.dart';
import 'package:nav_tab/postScreen.dart';

String a =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut aliquet ligula. ";
String b =
    " Duis nec ultrices dui. Nulla ornare felis lorem, a vestibulum ligula facilisis id. Nam interdum pharetra dui.";
String c =
    " Etiam eget tincidunt odio, id tempus erat. Vivamus tempor, lectus tempus commodo dapibus,";
String d = " mauris ipsum tempor libero, quis auctor nunc enim nec leo.";
String e =
    " Curabitur sodales risus et pellentesque sodales. Cras nec consequat mi.";
String f = " Vivamus mollis diam enim, non lobortis neque semper ut.";

void main() => runApp(mainPage());

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo",
      home: nav_tab(),
      theme: ThemeData(fontFamily: 'Grotesk'),

      /*initialRoute: '/',
      routes: {
        '/':(context) => nav_tab(),
        '/second':(context) => Solved()
      }*/
    );
  }
}

class nav_tab extends StatefulWidget {
  //nav_tab({Key key}) : super(key: key);

  @override
  nav_tab_state createState() => nav_tab_state();
}

class nav_tab_state extends State<nav_tab> {
  int _selected_index = 0;

  void Function()? changeScreen(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  //final void Function()? onTap => onTap(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              /*endDrawer: ProfileDrawer(),*/
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: FloatingActionButton(
                heroTag: 'main1',
                splashColor: Colors.grey,
                backgroundColor: Colors.deepPurpleAccent,
                highlightElevation: 5,
                hoverColor: Colors.blue,
                focusColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  color: Color(0xFFD6FFE7),
                ),
                onPressed: () {
                  print("Button Pressed");
                  Navigator.of(this.context)
                      .push(MaterialPageRoute(builder: (context) => NewPost()));
                },
              ),
              appBar: AppBar(
                actions: [
                  IconButton(
                      icon: Icon(Icons.notifications),
                      color: Color(0xFF2DBF6B),
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NotificationView())),
                          }),
                ],
                toolbarHeight: 30,
                title: Text(
                  "Gürültüden Gündeme!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2DBF6B),
                  ),
                  textAlign: TextAlign.start,
                ),
                leading: Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage())),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/furkan2.jpeg"),
                    ),
                  );
                }),
                /*actions: <Widget>[
              IconButton(
                onPressed: () => ProfileDrawer(),
                icon: Icon(Icons.person,color: Colors.white),
                alignment: Alignment.center,
                ),
            ],*/
                bottom: TabBar(
                  labelColor: Color(0xFF2DBF6B),
                  unselectedLabelColor: Colors.black38,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "News", icon: Icon(CupertinoIcons.flame)),
                    Tab(
                        text: "Populer",
                        icon: Icon(CupertinoIcons.arrow_up_to_line_alt)),
                    /* Tab(text: "Saved", icon: Icon(Icons.save_as_rounded)),
                    Tab(
                        text: "Notifications",
                        icon: Icon(Icons.notification_add)), */
                  ],
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: TabBarView(
                children: [
                  News(),
                  /*Container(
                child: Center(child: Icon(Icons.music_note)),
              ),*/ //Icon(Icons.museum),
                  Populers(),
                  /* Favorites(),
                  //Solved(),
                  NotificationView()*/
                  //Icon(Icons.museum),
                  //Icon(Icons.museum),
                  //Icon(Icons.museum)
                ],
              ),
              bottomNavigationBar: BubbleBottomBar(
                //int index = 0;
                opacity: 0,
                backgroundColor:
                    /*  Color.fromARGB(149, 245, 161, 36) */ Colors.white,

                currentIndex: _selected_index,
                items: <BubbleBottomBarItem>[
                  BubbleBottomBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        color: Color(0xFF2DBF6B),
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.home,
                        color: Colors.blue,
                      ),
                      title: Text('Anasayfa'),
                      backgroundColor: Colors.blue),
                  BubbleBottomBarItem(
                      icon: Icon(
                        CupertinoIcons.search_circle,
                        color: Color(0xFF2DBF6B),
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.search_circle,
                        color: Colors.blue,
                      ),
                      title: Text('Ara'),
                      backgroundColor: Colors.blue),
                  BubbleBottomBarItem(
                      badge: Text('3'),
                      badgeColor: Colors.indigo,
                      showBadge: _selected_index != 2,
                      icon: Icon(
                        CupertinoIcons.text_bubble,
                        color: Color(0xFF2DBF6B),
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.text_bubble,
                        color: Colors.blue,
                      ),
                      title: Text('Yeni'),
                      backgroundColor: Colors.blue),
                  BubbleBottomBarItem(
                      icon: Icon(
                        CupertinoIcons.person,
                        color: Color(0xFF2DBF6B),
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.person,
                        color: Color(0xFF2DBF6B),
                      ),
                      title: Text('Profil'),
                      backgroundColor: Colors.blue)
                ],
                onTap: (index) {
                  setState(() {
                    _selected_index = index!;
                  });
                  /*if (index == 3) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  }*/
                },
                elevation: 10,
                tilesPadding: EdgeInsets.symmetric(horizontal: 2),
                hasInk: true,
                inkColor: Color(0xFF2DBF6B),
                hasNotch: true,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                fabLocation: BubbleBottomBarFabLocation.end,
              ),

              /*BottomNavigationBar(
            onTap: (int index){
              setState(() {
                _selected_index = index;
              });
            },
            currentIndex: _selected_index,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.green,
            //onItemTapped(getCurrentTag()),
            //unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
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
          ),*/
            ))
        //Expands
        );
  }
}

/*BubbleBottomBar(
            hasNotch: true,
            hasInk: false,
            fabLocation: BubbleBottomBarFabLocation.end,
            opacity: 0.3,
            onTap: changeScreen,
            currentIndex: _selected_index,
            elevation: 8,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(Icons.home, color: Colors.black),
                activeIcon: Icon(Icons.home, color: Colors.purple),
              )
            ],
          )*/