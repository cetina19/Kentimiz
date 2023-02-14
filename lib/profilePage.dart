import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final double top = coverHeight - (profileHeight / 2);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 50),
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: profileHeight / 2),
                  child: buildCoverImage(),
                ),
                Positioned(top: top, child: buildProfileImage()),
              ]),
          buildContent()
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://pbs.twimg.com/profile_banners/810362682/1635283083/1500x500',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            'https://pbs.twimg.com/profile_images/1486729556434116617/4QN0gQqu_400x400.jpg'),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            "Furkan Güney",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text("Öğrenci",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.comment),
                    Text("498",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text("Şişli",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Hakkında", style: TextStyle(fontSize: 25)),
                ),
                Divider(height: 8, thickness: 6, color: Colors.red),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                      "Merhaba ben Furkan yaklaşık 2 senedir bu uygulamayı kullanmaktayım. "+
                      "Çevremdekilerin de desteğiyle sayamayacağım kadar çok sorunun çözülmesinde rol oynadım."+
                      " Umarım kullandığım bu ortamın bana ve çevremdekilere katıp arttırdığı bu çevre bilinci "+
                      "sayesinde gelecekte çok daha fazla sorunun çözümüne bizzat tekrar katılırım.",
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ],
      );
}
