import 'package:cool_alert/cool_alert.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class TambahKawin extends StatefulWidget {
  const TambahKawin({ Key? key }) : super(key: key);

  @override
  _TambahKawinState createState() => _TambahKawinState();
}

class _TambahKawinState extends State<TambahKawin> {
  final formatDate = DateFormat("yyyy-MM-dd");

  TextEditingController tanggal = TextEditingController();
  final TextEditingController _aktaKawin = TextEditingController();
  final TextEditingController _tempatKawin = TextEditingController();

  void tambahKawin() async {
    var kawin = await http.post(Uri.parse('http://192.168.1.6/db-sipil/kawin.php?function=insert_kawin'),
      body: {
        "tanggal_kawin": tanggal.text,
        "akta_kawin": _aktaKawin.text,
        "tempat_kawin": _tempatKawin.text,
      }
    );
    if (kawin.statusCode == 200) {
      // ignore: avoid_print
      print(kawin.body);
      tanggal.text = " ";
      _aktaKawin.text = " ";
      _tempatKawin.text = " ";
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Data berhasil ditambahkan",
      );
    } else {
      // ignore: avoid_print
      print("Terdapat kesalahan");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Kawin"),
        backgroundColor: primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DateTimeField(
                  controller: tanggal,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Kawin',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                const SizedBox(height: 20),
                TextField(
                  controller: _aktaKawin,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Akta Kawin"
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _tempatKawin,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tempat Kawin"
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      tambahKawin();
                    },
                    child: const Text(
                      "Tambah Data",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primary)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}