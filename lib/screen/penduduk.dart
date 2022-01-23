import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendataan_warga_sipil/model/penduduk_model.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class PendudukPage extends StatefulWidget {
  const PendudukPage({ Key? key }) : super(key: key);

  @override
  _PendudukPageState createState() => _PendudukPageState();
}

class _PendudukPageState extends State<PendudukPage> {
  final List<PendudukModel> getPenduduk = [];
  List<PendudukModel> get listPenduduk => getPenduduk;

  
  Future<List> getDataPenduduk() async {
    final response = await http.get(Uri.parse('http://192.168.1.6/db-sipil/penduduk.php?function=get_penduduk'));
    debugPrint(response.body);
    return jsonDecode(response.body);
  }

  @override
// ignore: must_call_super
  void initState() {
    super.initState();
    getDataPenduduk().then((value) {
      setState(() {
        for (Map listen in value) {
          getPenduduk.add(PendudukModel.fromJson(listen as dynamic));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penduduk'),
        backgroundColor: primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: getPenduduk.length,
          itemBuilder: (context, index) {
            return CardItem(
              nik: getPenduduk[index].nik.toString(),
              nama: getPenduduk[index].nama,
              jenisKelamin: getPenduduk[index].jenisKelamin,
              agama: getPenduduk[index].agama,
              statusKawin: getPenduduk[index].statusKawin,
              pekerjaan: getPenduduk[index].pekerjaan,
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

  const CardItem({
    Key? key,
    required this.nik,
    required this.nama,
    required this.jenisKelamin,
    required this.agama,
    required this.statusKawin,
    required this.pekerjaan,
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
            ],
          ),
        ),
      ),
      // child: Card(
      //   child: Column(
      //     children:  [
      //       Text(
      //         nik,
      //         style:  TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         nama,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         jenisKelamin,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         agama,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         statusKawin,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         pekerjaan,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}