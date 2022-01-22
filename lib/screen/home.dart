import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pendataan_warga_sipil/screen/add_user.dart';
import 'package:pendataan_warga_sipil/screen/kelahiran.dart';
import 'package:pendataan_warga_sipil/screen/penduduk.dart';
import 'package:pendataan_warga_sipil/screen/wafat.dart';
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
                const SayHello(),
                const SizedBox(height: 20),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PendudukPage()));
                        },
                        child: Column(
                          children: [
                            Image.asset("assets/images/sehat.png", height: 80, width: 80,),
                            const Text(
                              "penduduk",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const WafatPage()));
                        },
                        child: Column(
                          children: [
                            Image.asset("assets/images/meninggal.png", height: 80, width: 80,),
                            const Text(
                              "Penduduk Wafat",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const KelahiranPage()));
                        },
                        child: Column(
                          children: [
                            Image.asset("assets/images/lahir.png", height: 80, width: 80,),
                            const Text(
                              "Penduduk Lahir",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
              "Hello ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Selamat bekerja dengan santai, jangan terlalu fokus karna fokus bapaknya son",
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
  final String ontep;

  const Penduduk({ 
    Key? key,
    required this.judul,
    required this.image,
    required this.ontep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(ontep);
        },
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
      ),
    );
  }
}

class CardPeople extends StatelessWidget {
  const CardPeople({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40)
      ),
      padding: const EdgeInsets.only(top: 120),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUser()));
        },
        child: Center(
          child: Card(
            color: Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/rianne-zuur-2NITiiVwWBE-unsplash.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter
                )
              ),
              child: const Text(
                "Tambah data kelahiran",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}