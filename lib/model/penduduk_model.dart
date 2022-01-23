import 'dart:convert';

List<PendudukModel> welcomeFromJson(String str) => List<PendudukModel>.from(json.decode(str).map((x) => PendudukModel.fromJson(x)));

String welcomeToJson(List<PendudukModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendudukModel {
    PendudukModel({
      required this.id,
      required this.nik,
      required this.nama,
      required this.jenisKelamin,
      required this.agama,
      required this.statusKawin,
      required this.pekerjaan,
    });

    String id;
    String nik;
    String nama;
    String jenisKelamin;
    String agama;
    String statusKawin;
    String pekerjaan;

    factory PendudukModel.fromJson(Map<String, dynamic> json) => PendudukModel(
        id: json["id"],
        nik: json["nik"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        statusKawin: json["status_kawin"],
        pekerjaan: json["pekerjaan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "status_kawin": statusKawin,
        "pekerjaan": pekerjaan,
    };
}
