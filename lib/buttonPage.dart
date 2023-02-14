import 'package:flutter/material.dart';
import 'package:nav_tab/main.dart';
import 'package:nav_tab/pages/news.dart';
import 'package:nav_tab/pages/news2.dart';
import 'package:flutter/cupertino.dart';

class Solved extends StatefulWidget {
  const Solved({Key? key}) : super(key: key);

  @override
  State<Solved> createState() => _SolvedState();
}

class _SolvedState extends State<Solved> {
  bool click = false;
  bool click2 = false;
  int Number = 497;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                elevation: 8,
                //toolbarHeight: 4,
                backgroundColor: Colors.lightBlue,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SizedBox(
                      width: 30,
                      height: 25,
                      child: DecoratedBox(
                          position: DecorationPosition.background,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            /*gradient: LinearGradient(
                          colors: [Colors.red,Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        ),*/
                            //color: Colors.green
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons
                                  .chevron_left_sharp)) //Text('Geri',textAlign: TextAlign.center,)),
                          ),
                    )),
                actions: [],
                title: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Belediyenin Çözümü",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ],
                    ))),
            body: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Example3(false, click2, context, Number, true),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.arrow_circle_down_rounded,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:
                                Icon(Icons.arrow_circle_down_rounded, size: 30),
                          ),
                          Expanded(
                            flex: 1,
                            child:
                                Icon(Icons.arrow_circle_down_rounded, size: 30),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Color(0xAA7ED957), //renk değişimi için
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.75,
                              width: MediaQuery.of(context).size.width * 0.89,
                              child: Column(children: [
                                Expanded(
                                  flex: 155,
                                  child: Column(
                                    children: [
                                      //Padding(padding: EdgeInsets.only(top: 10)),
                                      Padding(
                                        //alignment: Alignment(40,20),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        child: Row(
                                          children: [
                                            //Icon(Icons.heart_broken,size: 20,),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4, left: 4),
                                                child: Icon(
                                                  CupertinoIcons
                                                      .checkmark_alt_circle,
                                                  size: 24,
                                                  color: Colors.green,
                                                )),
                                            Expanded(
                                              flex: 14,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 6),
                                                  child: Wrap(
                                                    direction: Axis.vertical,
                                                    children: [
                                                      Text(
                                                        "İşaret levhası devrilmiş",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Grotesk'),
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text("İki gün önce",
                                                          style: TextStyle(
                                                              fontSize: 11))
                                                    ],
                                                  )),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15,
                                                    bottom: 14,
                                                    left: 7,
                                                    top: 35),
                                                //alignment: Alignment,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 137,
                                  child: Column(
                                    //Text Yazısı icin
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Belediyenin ve çevrediklerin de yardımıyla bu sorunun üstesinden gelmiş bulunmaktayız."+
                                            " Destek olan herkese çok teşekkür ederiz. "
                                            +"Artık geçmişte tehlikeye sebep olan bu yol daha güvenli",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily: 'Grotesk',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 400,
                                  child: Column(
                                    //Foto icin
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 30,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.18,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset(
                                                      'assets/images/fixed1.jpeg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              indent: 5,
                                              thickness: 10,
                                            ),
                                            Expanded(
                                              flex: 30,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.18,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset(
                                                      'assets/images/fixed2.jpeg',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 120,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, bottom: 10),
                                          child: RichText(
                                            //textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                CupertinoIcons
                                                    .placemark, //paperplane
                                                size: 22,
                                              )),
                                              TextSpan(
                                                  text: 'Atakent Mahallesi',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                            ]),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 48, bottom: 10),
                                          child: RichText(
                                            text: TextSpan(children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                      CupertinoIcons.share,
                                                      size: 23)),
                                              TextSpan(
                                                  text: ' Paylaş',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black)),
                                              WidgetSpan(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 2),
                                                child: Icon(
                                                    CupertinoIcons
                                                        .exclamationmark_triangle,
                                                    size: 20),
                                              )),
                                              TextSpan(
                                                  text: ' Raporla',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black))
                                            ]),
                                          ),
                                        )
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }
}

class Ratings extends StatefulWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text('Go Back')),
      ),
    );
  }
}

Card Example3(bool solved, bool click, BuildContext context, int Number, bool newPage) {
  //solved = true;
  //Number = newPage ? 497 : 27;
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: solved
        ? Color(0xAA7ED957)
        : Color.fromARGB(146, 44, 169, 241), //renk değişimi için
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.89,
        child: Column(children: [
          Expanded(
            flex: 199,
            child: Column(
              children: [
                //Padding(padding: EdgeInsets.only(top: 10)),
                Padding(
                  //alignment: Alignment(40,20),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Row(
                    children: [
                      //Icon(Icons.heart_broken,size: 20,),
                      Padding(
                          padding: EdgeInsets.only(bottom: 4, left: 4),
                          child: solved
                              ? Icon(
                                  CupertinoIcons.checkmark_alt_circle,
                                  size: 24,
                                  color: Colors.green,
                                )
                              : Icon(
                                  CupertinoIcons.personalhotspot,
                                  size: 24,
                                  color: Colors.red[800],
                                )),
                      Expanded(
                        flex: 14,
                        child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(newPage ?
                                  "İşaret levhası devrilmiş" : "Yollar bozuk",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Grotesk'),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(newPage ? "İki gün önce" : "İki hafta önce",
                                    style: TextStyle(fontSize: 11))
                              ],
                            )),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: 15, bottom: 14, left: 7, top: 6),
                            //alignment: Alignment,

                            child: Container(
                              height: 30,
                              //padding: EdgeInsets.only(top: 3,bottom: 8),
                              //width: 70,
                              //height: 30,
                              //fit: BoxFit.contain,
                              child: solved
                                  ? FloatingActionButton.extended(
                                      heroTag: null,
                                      backgroundColor:
                                          Color.fromRGBO(126, 217, 87, 0.5),
                                      label: Text(
                                        'ÇÖZDÜK!',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontFamily: 'Grotesk'),
                                      ),
                                      //icon: Icon(Icons.abc),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        //print("Hey");
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Solved()));
                                        //Navigator.push(context, '/second');
                                        //Solved();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Solved()));
                                      })
                                  : Container(),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 177,
            child: Column(
              //Text Yazısı icin
              children: <Widget>[
                /*Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(A+A+A, maxLines: 3, overflow: TextOverflow.clip,softWrap: false,)
                          ,
                        )*/
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(newPage ? A1 : B1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          fontFamily: 'Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 430,
            child: Column(
              //Foto icin
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 22,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(newPage ?
                              'assets/images/not_fixed.jpeg' : 'assets/images/not_fixed2.jpeg',
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    Expanded(
                        flex: 20,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Column(
                              children: [
                                //Expanded(
                                //flex: 8,
                                //child: Text('497 | !!!!!',style: TextStyle(fontSize: 3),)),
                                Padding(
                                    //flex: 8,
                                    //fit: BoxFit.cover,
                                    padding:
                                        EdgeInsets.only(bottom: 19, left: 8),
                                    child: IntrinsicHeight(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 39,
                                            child: Row(children: [
                                              Text('$Number',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: solved
                                                          ? Colors.green
                                                          : Color.fromRGBO(
                                                              12, 17, 87, 1))),
                                              VerticalDivider(
                                                width: 4,
                                              ),
                                              VerticalDivider(
                                                color: Colors.black,
                                                indent: 5,
                                                endIndent: 6,
                                                thickness: 1.15,
                                                width: 21,
                                              ),
                                              Text(newPage ?
                                                '!  !  !  !  !' : '!  !  !',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: solved
                                                        ? Colors.green
                                                        : Color.fromRGBO(
                                                            12, 21, 87, 1)),
                                              )
                                            ]),
                                          ),
                                          //FloatingActionButton()
                                          //VerticalDivider(thickness: 10, width: 20,indent: ,),
                                          Expanded(
                                            flex: 68,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 30, top: 1),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  width: click ? 105 : 140,
                                                  height: 40,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: solved
                                                          ? Colors.green
                                                          : Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: IconButton(
                                                      //key: 'son',
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      icon: RichText(
                                                        text: TextSpan(
                                                            children: [
                                                              WidgetSpan(
                                                                child: Icon(
                                                                    CupertinoIcons
                                                                        .check_mark_circled,
                                                                    size:
                                                                        18), 
                                                              ),
                                                              TextSpan(
                                                                  text: click
                                                                      ? ' Vazgeç'
                                                                      : ' Sen de katıl!',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          65,
                                                                          50,
                                                                          50),
                                                                      fontSize:
                                                                          16)),
                                                            ]),
                                                      ),
                                                      onPressed: () {
                                                        
                                                        
                                                          click=!click;
                                                        if (click) {
                                                          //rated=false;
                                                          Number++;
                                                          if(newPage==false){
                                                            Number=28;
                                                          }
                                                        } else {
                                                          //if(rated)
                                                          Number--;
                                                          if(newPage==false){
                                                            Number=27;
                                                          }
                                                          //titleControl.clear();
                                                          //textControl.clear();
                                                          //rated = false;
                                                        }
                                                      }
                                                      /*Navigator.of(this.context).push(
                                                          MaterialPageRoute(
                                                          builder: (context) => Ratings()));*/
                                                      ,
                                                    ),
                                                    //)
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                            width: 2,
                                            indent: 2,
                                          ),
                                          Expanded(
                                            flex: 34,
                                            child: Row(
                                              children: [
                                                RichText(
                                                    text: TextSpan(children: [
                                                  WidgetSpan(
                                                      child: Icon(
                                                          CupertinoIcons.share,
                                                          size: 23)),
                                                  TextSpan(
                                                      text: ' Paylaş',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                                  WidgetSpan(
                                                      child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 2),
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .exclamationmark_triangle,
                                                        size: 20),
                                                  )),
                                                  TextSpan(
                                                      text: ' Raporla',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                                ]))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            )))
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 115,
              child: Padding(
                padding: EdgeInsets.only(right: 160, bottom: 10),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      CupertinoIcons.placemark, //paperplane
                      size: 22,
                    )),
                    TextSpan(
                        text: newPage ? 'Atakent Mahallesi' : 'Reşitpaşa Mahallesi',
                        style: TextStyle(fontSize: 10, color: Colors.black))
                  ]),
                ),
              ))
        ]),
      ),
    ),
  );
}

/*Expanded(
                                              flex: 39,
                                              child: Row(children: [
                                                Text('$Number',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.green)),
                                                VerticalDivider(
                                                  width: 4,
                                                ),
                                                VerticalDivider(
                                                  color: Colors.black,
                                                  indent: 5,
                                                  endIndent: 6,
                                                  thickness: 1.15,
                                                  width: 21,
                                                ),
                                                Text(
                                                  '!  !  !  !  !',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.green),
                                                )
                                              ]),
                                            ),
                                            //FloatingActionButton()
                                            //VerticalDivider(thickness: 10, width: 20,indent: ,),
                                            Expanded(
                                              flex: 68,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 30, top: 1),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: click ? 105 : 140,
                                                    height: 40,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: IconButton(
                                                        //key: 'son',
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        icon: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                WidgetSpan(
                                                                    child: Icon(CupertinoIcons.check_mark_circled,size: 18),/*click
                                                                        ? Icon(
                                                                            Icons.add_task,
                                                                            size:
                                                                                18,
                                                                          )
                                                                        : Icon(
                                                                            Icons.add_task,
                                                                            size:
                                                                                18,
                                                                          )*/),
                                                                TextSpan(
                                                                    text: click
                                                                        ? ' Vazgeç'
                                                                        : ' Sen de katıl!',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            65,
                                                                            50,
                                                                            50),
                                                                        fontSize:
                                                                            16)),
                                                              ]),
                                                        ),
                                                        onPressed: () {
                                                          click = !click;
                                                          /*if (click == true) {
                                                            buildRating();
                                                          }*/
                                                          //setState(() {
                                                            if (click) {
                                                              //rated=false;
                                                              Number++;
                                                            } 
                                                            else{
                                                              //if(rated)
                                                              Number--;
                                                              //titleControl.clear();
                                                              //textControl.clear();
                                                              //rated = false;
                                                            }
                                                          
                                                        }
                                                          /*Navigator.of(this.context).push(
                                                          MaterialPageRoute(
                                                          builder: (context) => Ratings()));*/
                                                        ,
                                                      ),
                                                      //)
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              width: 2,
                                              indent: 2,
                                            ),
                                            Expanded(
                                              flex: 34,
                                              child: Row(
                                                children: [
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    WidgetSpan(
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .share,
                                                            size: 23)),
                                                    TextSpan(
                                                        text: ' Paylaş',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black)),
                                                    WidgetSpan(
                                                        child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20, top: 2),
                                                      child: Icon(
                                                          CupertinoIcons
                                                              .exclamationmark_triangle,
                                                          size: 20),
                                                    )),
                                                    TextSpan(
                                                        text: ' Raporla',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black)),
                                                  ]))
                                                ],
                                              ),
                                            ) */
