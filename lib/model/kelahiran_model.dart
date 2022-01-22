import 'dart:convert';

List<KelahiranModel> welcomeFromJson(String str) => List<KelahiranModel>.from(json.decode(str).map((x) => KelahiranModel.fromJson(x)));

String welcomeToJson(List<KelahiranModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KelahiranModel {
    KelahiranModel({
        required this.nomorKelahiran,
        required this.tempat,
        required this.hari,
        required this.tanggal,
        required this.keterangan,
    });

    String nomorKelahiran;
    String tempat;
    String hari;
    DateTime tanggal;
    String keterangan;

    factory KelahiranModel.fromJson(Map<String, dynamic> json) => KelahiranModel(
        nomorKelahiran: json["nomor_kelahiran"],
        tempat: json["tempat"],
        hari: json["hari"],
        tanggal: DateTime.parse(json["tanggal"]),
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "nomor_kelahiran": nomorKelahiran,
        "tempat": tempat,
        "hari": hari,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "keterangan": keterangan,
    };
}
