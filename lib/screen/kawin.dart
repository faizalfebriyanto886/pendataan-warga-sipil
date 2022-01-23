import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/model/kawin_model.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class KawinPage extends StatefulWidget {
  const KawinPage({ Key? key }) : super(key: key);

  @override
  _KawinPageState createState() => _KawinPageState();
}

class _KawinPageState extends State<KawinPage> {
  final List<KawinModel> getKawin = [];
  List<KawinModel> get listKawin => getKawin;

  
  Future<List> getDataKawin() async {
    final response = await http.get(Uri.parse('http://192.168.1.6/db-sipil/kawin.php?function=get_kawin'));
    debugPrint(response.body);
    return jsonDecode(response.body);
  }

  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    getDataKawin().then((value) {
      setState(() {
        for (Map listen in value) {
          getKawin.add(KawinModel.fromJson(listen as dynamic));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penduduk Lahir'),
        backgroundColor: primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: getKawin.length,
          itemBuilder: (context, index) {
            return CardItem(
              tanggal: getKawin[index].tanggalKawin.toString(),
              akta: getKawin[index].aktaKawin,
              tempat: getKawin[index].tempatKawin,
            );
          },
        )
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String tanggal;
  final String akta;
  final String tempat;


  const CardItem({
    Key? key,
    required this.tanggal,
    required this.akta,
    required this.tempat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children:  [
                  const Text(
                    "Tanggal Kawin :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    tanggal
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Akta Kawin :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    akta
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Tempat Kawin :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    tempat
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}