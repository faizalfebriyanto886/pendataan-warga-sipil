import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: (Colors.grey[100])!,
        items: [
          Icon(
            Icons.home_filled,
            color: primary,
          ),
          Icon(
            Icons.add_circle_outline,
            color: primary,
          ),
          Icon(
            Icons.calendar_today_outlined,
            color: primary,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width, 100.0
                )
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
                  child: Row(
                    children: [
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 210),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset('assets/images/profile.png', width: 40, height: 40,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SayHello()
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Penduduk",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Penduduk(judul: "Penduduk Lama", image: "assets/images/sehat.png",),
                    Penduduk(judul: "Penduduk Lahir", image: "assets/images/lahir.png",),
                    Penduduk(judul: "Penduduk Wafat", image: "assets/images/meninggal.png",),
                  ],
                ),
                const SizedBox(height: 20),
                const CardPeople()
              ],
            ),
          ),
        ],
      )
    );
  }
}

class SayHello extends StatelessWidget {
  const SayHello({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hello Nep",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Proin eget tortor risus. Cras ultricies ligula sed magna dictum porta.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

class Penduduk extends StatelessWidget {
  final String judul;
  final String image;
  const Penduduk({ 
    Key? key,
    required this.judul,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                image,
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 5),
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CardPeople extends StatelessWidget {
  const CardPeople({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 40, 300, 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/rianne-zuur-2NITiiVwWBE-unsplash.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter
            )
          ),
          child: const Text("lala"),
        ),
      ),
    );
  }
}