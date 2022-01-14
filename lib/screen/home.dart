import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _tapButton(int i) {
    setState(() {
      // ignore: avoid_print
      print('null');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.white,
        onTap: _tapButton, 
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            selectedColor: primary,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
            selectedColor: primary,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.calendar_today_outlined),
            selectedColor: primary,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 200),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: primary,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Text(
                          "Hai Sonep",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 60),
                        Text(
                          "Hai sonep",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 60),
                        Text(
                          "Hai sonep",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                SizedBox(height: 10, width: 5,),
                Text(
                  "Pengeluaran harian",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 180,),
                TextButton(
                  onPressed: null,
                  child: Text("See all", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                )
              ],
            ),
            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}