import 'package:flutter/material.dart';
import 'package:nav_tab/profilePage.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({ Key? key }) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isCollapsed = true;
    return Container(
      alignment: Alignment.bottomLeft,
      width: isCollapsed ? MediaQuery.of(context).size.width/1.90 : 0,
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 16, 69, 160),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
                    height: 30,
                    width: MediaQuery.of(context).size.width/1.90,
                    color: Color.fromARGB(255, 166, 172, 228),
                    child: Text("Settings", style: 
                            TextStyle(fontSize: 19, color: Color.fromARGB(255, 97, 79, 79)/*Color.fromARGB(255, 189, 69, 33)*/, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                  )
                ],
              ),
              //buildList(isCollapsed: isCollapsed, items: itemsFirst)
            ]
          ),
        ),
      ),
    );
  }
  Widget buildList({
    required bool isCollapsed,
    required List<SideItem> items,
  }) => ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: items.length,
    itemBuilder: (context,index){
      final item = items[index];
      return buildMenuItem(
        isCollapsed: isCollapsed,
        text: item.title,
        icon: item.icon,
        onClicked: (){}
      );
    },
  );

  Widget buildMenuItem({required bool isCollapsed, required String text, required IconData icon, 
  VoidCallback? onClicked}) {
    final color = Colors.white;
    final leading = Icon(icon, color:color);

    return ListTile(
      leading: leading,
      title: Text(text)
    );
  }
}

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({ Key? key }) : super(key: key);

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isCollapsed = true;
    return Container(
      // ignore: dead_code
      width: isCollapsed ? MediaQuery.of(context).size.width/1.3 : 0,
      
      child: Drawer(
        child: Container(
          //color: Color.fromARGB(255, 155, 78, 15),
          child: ProfilePage(),
        ),
      ),
    );
  }
}

class SideItem{
  final String title;
  final IconData icon;

  const SideItem({
    required this.title,
    required this.icon
  });
}

final itemFirst = [
  SideItem(title: 'Snow', icon: Icons.cloudy_snowing),
  SideItem(title: 'Damaged Road', icon: Icons.horizontal_distribute_sharp),
  SideItem(title: 'Weak Connection', icon: Icons.radar_outlined),
  SideItem(title: 'Ramp', icon: Icons.signal_cellular_0_bar_rounded),
];

final itemsSecond = [
  SideItem(title: 'Deployment', icon: Icons.accessibility),
  SideItem(title: 'Resources', icon: Icons.extension)
];