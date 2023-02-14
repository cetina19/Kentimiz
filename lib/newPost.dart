import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nav_tab/postScreen.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? image;
  String? baslikk;
  List? postBilgileri;
  final items = [
    "Adalar",
    "Arnavutköy",
    "Ataşehir",
    "Avcılar",
    "Bağcılar",
    "Bahçelievler",
    "Bakırköy",
    "Başakşehir",
    "Bayrampaşa",
    "Beşiktaş",
    "Beykoz",
    "Beylikdüzü",
    "Beyoğlu",
    "Büyükçekmece",
    "Çatalca",
    "Çekmeköy",
    "Esenler",
    "Esenyurt",
    "Eyüp",
    "Fatih",
    "Gaziosmanpaşa",
    "Güngören",
    "Kadıköy",
    "Kağıthane",
    "Kartal",
    "Küçükçekmece",
    "Maltepe",
    "Pendik",
    "Sancaktepe",
    "Sarıyer",
    "Silivri",
    "Sultanbeyli",
    "Sultangazi",
    "Şile",
    "Şişli",
    "Tuzla",
    "Ümraniye",
    "Üsküdar",
    "Zeytinburnu"
  ];

  String? ilceValue;
  String? mahalleValue;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image');
    }
  }

  Widget itemSecimi() => GestureDetector(
        onTap: () => {pickImage(ImageSource.gallery)},
        child: Container(
            width: 160, height: 200, child: Icon(Icons.add_a_photo_outlined)),
      );

  @override
  Widget build(BuildContext context) {
    final TextEditingController ctrl_baslik;
    ctrl_baslik = TextEditingController();
    final TextEditingController ctrl_aciklama;
    ctrl_aciklama = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image != null
                  ? GestureDetector(
                      onTap: () => {pickImage(ImageSource.gallery)},
                      child: Image.file(
                        image!,
                        width: 160,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : itemSecimi(),
              TextField(
                controller: ctrl_baslik,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "BAŞLIK"),
              ),
              TextField(
                controller: ctrl_aciklama,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Açıklama"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 4)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Container(
                              //and here
                              child: Text(
                                "İlçe",
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: ilceValue,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                                  () => this.ilceValue = value,
                                )),
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 4)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Container(
                              //and here
                              child: Text(
                                "Mahalle",
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            value: mahalleValue,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                                  () => this.mahalleValue = value,
                                )),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostScreen())),
                  child: Text('Paylaş'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
