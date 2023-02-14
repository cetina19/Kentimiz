import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nav_tab/pages/populers.dart';
import 'package:nav_tab/buttonPage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hexcolor/hexcolor.dart';

String A1 ="Arabalar bu konumdan oldukça fazla geçiyor ve bu levha trafik düzeni için oldukça önemli çok önemli. "+
"Herhangi bir sıkıntı yaşamadan düzeltilmesi gerekiyor. Belediyenin bu konuya el atıp kimsenin tehlikeye atılmadan "+
"sorunun çözülmesi çevre sakinleri "+
"için önemlidir ve ilgili yerlere iletimin yapılabilmesi adına katılıp paylaşabilmeniz gerçekten önemli.";
String B1 = "Yol bozukluğu eğer giderilmezse bu güzergahtan geçen arabalar yayalar için büyük tehdit oluşturması kaçınılmazdır."+
" Bu tarz tehlikelerin en yakın zamanda azaltılıp düzeltilmesi şu anda büyük önem arz ediyor. "+
"Belediye ve ilgili makamlar henüz harekete geçmedi. "+
"Lütfen sen de katıl ve sorunun önemine dikkat çekmede bize yardımcı ol.";

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final ScrollController _scrollController = ScrollController();
  List<Card> items = [];
  bool loading = false, allLoaded = false;
  Color GC = Color.fromRGBO(126, 217, 87, 1);
  bool click = false;
  bool click2=false;
  bool rated = false;
  int Number = 497;
  double rating = 5;
  final titleControl = TextEditingController();
  final textControl = TextEditingController();
  bool solved = false;

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<Card> newData =
        items.length >= 60 ? [] : List.generate(20, (index) => Example2(false));
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
      backgroundColor: Colors.white,
      /*appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),*/
      body: LayoutBuilder(builder: (context, constraints) {
        if (items.isNotEmpty) {
          return Stack(
            children: [
              ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      if(index==0){
                        return Example2(false);
                      }
                      else if (index==1){
                        return Example3(false, click2, context, 27 ,false);
                      }
                      return ListTile(title: Example2(false) //items.first,
                          );
                    } else {
                      return Container(
                          width: constraints.maxWidth,
                          height: 30,
                          child: Text(
                            "Please Refresh The Page",
                            textAlign: TextAlign.center,
                          ));
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
      backgroundColor: Colors.white,
      toolbarOpacity: 0,
        elevation: 8,
        toolbarHeight: 4,
        //backgroundColor: Colors.lightBlue,
        title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Posts",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))
              ],
            )
          )
        );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Color.fromRGBO(255, 193, 7, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.lightBlue, Colors.green],
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
                  )
                ],
              )
            ],
          )),
    );
  }

  void buildRating() {
    showDialog(
        context: context,
        builder: (context) {
          context:
          Text('Current Rating = 5');
          return AlertDialog(
            title: Text('Sen de katıl!'),
            actions: [
              Column(
                children:[
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: RatingBar.builder(
                    initialRating: rated ? rating : 0,
                    minRating: 1,
                    maxRating: 5,
                    itemBuilder: (context, _) =>
                        Icon(CupertinoIcons.exclamationmark, color: Colors.blue),
                    updateOnDrag: true,
                    onRatingUpdate: (ratings) => this.rating = ratings),
                ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Yorum ekle',
                        border: OutlineInputBorder(),
                      ),
                      controller: titleControl,
                    ),
                  ),
                  TextButton(onPressed: () { 
                    rated = true;
                    Navigator.pop(context);}, 
                  child: Text('Ok')),
                  
                  ])
            ],
            content: Text('Sorununuzu oylayın ve belediyeye iletmek istediğiniz mesajı yazın.'),
          );
        });
  }

  Card Example2(bool secondWid) {
    solved = true;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: solved ? Color(0xAA7ED957) : Color.fromARGB(146, 44, 169, 241), //renk değişimi için
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.75,
          width: MediaQuery.of(context).size.width * 0.9,
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
                            child: solved ?  Icon(
                              CupertinoIcons.checkmark_alt_circle,
                              size: 24,
                              color: Colors.green,
                              ) : Icon(
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
                                  Text(
                                    "İşaret levhası devrilmiş",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Grotesk'),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text("İki gün önce",
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
                                child: solved ? FloatingActionButton.extended(
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
                                      Navigator.of(this.context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Solved()));
                                    }):Container(),
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
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        A1,
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
                        flex: 21,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/not_fixed.jpeg',
                                fit: BoxFit.fitHeight,
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
                                                        color: solved ? Colors.green : Color.fromRGBO(
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
                                                Text(
                                                  '!  !  !  !  !',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: solved ? Colors.green : Color.fromRGBO(
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: click ? 105 : 140,
                                                    height: 40,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: solved ? Colors.green : Colors.blue,
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
                                                                    child: Icon(CupertinoIcons.check_mark_circled,size: 18)),
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
                                                          if(secondWid){
                                                            click2=!click2;
                                                            if(click2){
                                                              buildRating();
                                                            }
                                                          }
                                                          if (click == true) {
                                                            buildRating();
                                                          }
                                                          setState(() {
                                                            if (click) {
                                                              //rated=false;
                                                              Number++;
                                                            } else{
                                                              //if(rated)
                                                              Number--;
                                                              titleControl.clear();
                                                              textControl.clear();
                                                              //rated = false;
                                                            }
                                                          });
                                                        },
                                                      ),
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
                        CupertinoIcons.placemark,//paperplane
                        size: 22,
                      )),
                      TextSpan(
                          text: 'Atakent Mahallesi',
                          style: TextStyle(fontSize: 10, color: Colors.black))
                    ]),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

