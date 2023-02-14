import 'dart:ui';

import 'package:nav_tab/postScreen.dart';

import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  List<String> basliklar = ["Kaldırım yok", "BBBBBBBB"];
  List<String> aciklamar = ["A ACİKLAMA", "B AÇIKLAMA"];
  List<String> tarih = ["13.09", "27.02.2022"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF2DBF6B),
      title: Text("Bildirimler"),
    );
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listViewItem(context, index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
          );
        },
        itemCount: 2);
  }

  Widget listViewItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PostScreen())),
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            prefixIcon(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [message(basliklar, index), timeAndDate(index)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      child: Icon(Icons.notifications, size: 32, color: Colors.blue.shade300),
    );
  }

  Widget message(List<String> basliklar, int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: basliklar[index],
          style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
              fontFamily: "Grotesk",
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            aciklamar[index],
            style: TextStyle(
              fontFamily: "Grotesk",
              fontSize: 11,
            ),
          ),
          Text(
            tarih[index],
            style: TextStyle(
              fontFamily: "Grotesk",
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
