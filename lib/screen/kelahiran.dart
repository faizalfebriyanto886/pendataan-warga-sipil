import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/model/kelahiran_model.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class KelahiranPage extends StatefulWidget {
  const KelahiranPage({ Key? key }) : super(key: key);

  @override
  _KelahiranPageState createState() => _KelahiranPageState();
}

class _KelahiranPageState extends State<KelahiranPage> {
  final List<KelahiranModel> getKelahiran = [];
  List<KelahiranModel> get listKelahiran => getKelahiran;

  
  Future<List> getDataKelahiran() async {
    final response = await http.get(Uri.parse('http://192.168.1.10/db-sipil/kelahiran.php?function=get_kelahiran'));
    debugPrint(response.body);
    return jsonDecode(response.body);
  }

  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    getDataKelahiran().then((value) {
      setState(() {
        for (Map listen in value) {
          getKelahiran.add(KelahiranModel.fromJson(listen as dynamic));
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
          itemCount: getKelahiran.length,
          itemBuilder: (context, index) {
            return CardItem(
              nomorKelahiran: getKelahiran[index].nomorKelahiran,
              tempat: getKelahiran[index].tempat,
              hari: getKelahiran[index].hari,
              tanggal: getKelahiran[index].tanggal.toString(),
              keterangan: getKelahiran[index].keterangan,
            );
          },
        )
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String nomorKelahiran;
  final String tempat;
  final String hari;
  final String tanggal;
  final String keterangan;


  const CardItem({
    Key? key,
    required this.nomorKelahiran,
    required this.tempat,
    required this.hari,
    required this.tanggal,
    required this.keterangan,
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
                    "Nomor kelahiran :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    nomorKelahiran
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Tempat :",
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
              Row(
                children:  [
                  const Text(
                    "Hari :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    hari
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Tanggal :",
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
                    "Keterangan :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    keterangan
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