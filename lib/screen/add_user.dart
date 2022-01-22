import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  const AddUser({ Key? key }) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final formatDate = DateFormat("yyyy-MM-dd");

  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nomorKelahiran = TextEditingController();
  final TextEditingController _tempat = TextEditingController();
  final TextEditingController _hari = TextEditingController();
  final TextEditingController _tanggal = TextEditingController();
  final TextEditingController _keterangan = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _jenis_kelamin = TextEditingController();
  final TextEditingController _agama = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _status_kawin = TextEditingController();
  final TextEditingController _pekerjaan = TextEditingController();


  void tambahData() async {
    var kelahiran = await http.post(Uri.parse('http://10.219.68.101/db-sipil/kelahiran.php?function=insert_kelahiran'),
      body: {
        "nomor_kelahiran": _nomorKelahiran.text,
        "tempat": _tempat.text,
        "hari": _hari.text,
        "tanggal":_tanggal.text,
        "keterangan": _keterangan.text,
        "nama": _nama.text,
        "jenis_kelamin": _jenis_kelamin.text,
        "agama": _agama.text,
        "status_kawin": _status_kawin.text,
        "pekerjaan": _pekerjaan.text,
      }
    );
    if (kelahiran.statusCode == 200) {
      // ignore: avoid_print
      print(kelahiran.body);
      // ignore: avoid_print
      print(_tanggal.text);
    } else {
      // ignore: avoid_print
      print("salah coy");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Input Data kelahiran",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _nama,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Nama",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _nomorKelahiran,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Nomor Kelahiran",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _tempat,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Tempat",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _hari,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Hari",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              DateTimeField(
                controller: _tanggal,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.adb),
                  labelText: 'Tanggal',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  )
                ),
                format: formatDate,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context, 
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(1900), 
                    lastDate: DateTime(2100)
                  );
                }
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _keterangan,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Keterangan",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _jenis_kelamin,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "jenis kelamin",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _agama,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "agama",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _status_kawin,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Status kawin",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _pekerjaan,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adb),
                  labelText: "Pekerjaan",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primary
                ),
                onPressed: () {
                  tambahData();
                },
                child: const Text("Tambahkan"))
            ],
          ),
        ),
      ),
    );
  }
}