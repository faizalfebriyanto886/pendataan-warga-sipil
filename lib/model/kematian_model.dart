import 'dart:convert';

List<KematianModel> welcomeFromJson(String str) => List<KematianModel>.from(json.decode(str).map((x) => KematianModel.fromJson(x)));

String welcomeToJson(List<KematianModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KematianModel {
    KematianModel({
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
    });

    String nik;
    String nama;
    String jenisKelamin;
    String agama;
    String statusKawin;
    String pekerjaan;
    String tempat;
    String hari;
    DateTime tanggal;
    String sebab;

    factory KematianModel.fromJson(Map<String, dynamic> json) => KematianModel(
        nik: json["nik"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        statusKawin: json["status_kawin"],
        pekerjaan: json["pekerjaan"],
        tempat: json["tempat"],
        hari: json["hari"],
        tanggal: DateTime.parse(json["tanggal"]),
        sebab: json["sebab"],
    );

    Map<String, dynamic> toJson() => {
        "nik": nik,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "status_kawin": statusKawin,
        "pekerjaan": pekerjaan,
        "tempat": tempat,
        "hari": hari,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "sebab": sebab,
    };
}
