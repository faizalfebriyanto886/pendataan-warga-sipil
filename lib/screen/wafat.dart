import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/model/kematian_model.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class WafatPage extends StatefulWidget {
  const WafatPage({ Key? key }) : super(key: key);

  @override
  _WafatPageState createState() => _WafatPageState();
}

class _WafatPageState extends State<WafatPage> {
  final List<KematianModel> getWafat = [];
  List<KematianModel> get listWafat => getWafat;

  
  Future<List> getDataMeninggal() async {
    final response = await http.get(Uri.parse('http://192.168.1.6/db-sipil/kematian.php?function=get_kematian'));
    debugPrint(response.body);
    return jsonDecode(response.body);
  }

  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    getDataMeninggal().then((value) {
      setState(() {
        for (Map listen in value) {
          getWafat.add(KematianModel.fromJson(listen as dynamic));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penduduk Wafat'),
        backgroundColor: primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: getWafat.length,
          itemBuilder: (context, index) {
            return CardItem(
              nik: getWafat[index].nik.toString(),
              nama: getWafat[index].nama,
              jenisKelamin: getWafat[index].jenisKelamin,
              agama: getWafat[index].agama,
              statusKawin: getWafat[index].statusKawin,
              pekerjaan: getWafat[index].pekerjaan,
              tempat: getWafat[index].tempat,
              hari: getWafat[index].hari,
              tanggal: getWafat[index].tanggal.toString(),
              sebab: getWafat[index].sebab,
            );
          },
        )
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String nik;
  final String nama;
  final String jenisKelamin;
  final String agama;
  final String statusKawin;
  final String pekerjaan;
  final String tempat;
  final String hari;
  final String tanggal;
  final String sebab;

  const CardItem({
    Key? key,
    required this.nik,
    required this.nama,
    required this.jenisKelamin,
    required this.agama,
    required this.statusKawin,
    required this.pekerjaan,
    required this.tempat,
    required this.hari,
    required this.tanggal,
    required this.sebab,
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
                    "NIK :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(nik)
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Nama :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    nama
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Jenis Kelamin :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    jenisKelamin
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Agama :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    agama
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Status Kawin :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    statusKawin
                  )
                ],
              ),
              Row(
                children:  [
                  const Text(
                    "Pekerjaan :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    pekerjaan
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
                    "Sebab :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    sebab
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