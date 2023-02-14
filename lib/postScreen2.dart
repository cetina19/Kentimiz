import 'package:flutter/material.dart';
import 'buttonPage.dart';
import 'dart:ui';
import 'dart:io';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool click = false;
  int number = 500;
  String A =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut aliquet ligula. ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Image.asset("assets/images/example_2.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "İşaret levhası devrilmiş",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton.extended(
                        heroTag: null,
                        backgroundColor: Color.fromRGBO(126, 217, 87, 0.5),
                        label: Text(
                          'ÇÖZDÜK!',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        //icon: Icon(Icons.abc),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          //print("Hey");
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Solved()));
                          //Navigator.push(context, '/second');
                          //Solved();
                          Navigator.of(this.context).push(MaterialPageRoute(
                              builder: (context) => Solved()));
                        }),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Text(
                              '$number',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(12, 17, 87, 1),
                              ),
                            ),
                            VerticalDivider(
                              width: 4,
                            ),
                            Text(
                              '!  !  !  !  !',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(12, 21, 87, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: click ? 105 : 140,
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        //key: 'son',
                        alignment: Alignment.centerLeft,
                        icon: RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                                child: click
                                    ? Icon(
                                        Icons.add_task,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.add_task,
                                        size: 18,
                                      )),
                            TextSpan(
                                text: click ? ' Vazgeç' : ' Sen De Katıl!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 65, 50, 50),
                                    fontSize: 16)),
                          ]),
                        ),
                        onPressed: () {
                          click = !click;
                          setState(() {
                            if (click) {
                              number++;
                            } else {
                              number--;
                            }
                          });
                          /*Navigator.of(this.context).push(
                                                                MaterialPageRoute(
                                                                builder: (context) => Ratings()));*/
                        },
                      ),
                      //)
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                child: Text(
                  A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A +
                      A,
                  maxLines: 50,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.location_on,
                        size: 22,
                      )),
                      TextSpan(
                          text: 'Atakent Mahallesi',
                          style: TextStyle(fontSize: 10, color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 2),
                        child: Icon(Icons.report_problem_outlined, size: 20),
                      )),
                      TextSpan(
                          text: ' Raporla',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.file_upload_outlined, size: 23)),
                      TextSpan(
                          text: ' Paylaş',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/diagne.png"),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Furkan Güneasdasdsay",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
