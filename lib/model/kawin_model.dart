import 'dart:convert';

List<KawinModel> welcomeFromJson(String str) => List<KawinModel>.from(json.decode(str).map((x) => KawinModel.fromJson(x)));

String welcomeToJson(List<KawinModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KawinModel {
    KawinModel({
      required this.id,
      required this.tanggalKawin,
      required this.aktaKawin,
      required this.tempatKawin,
    });

    String id;
    DateTime tanggalKawin;
    String aktaKawin;
    String tempatKawin;

    factory KawinModel.fromJson(Map<String, dynamic> json) => KawinModel(
        id: json["id"],
        tanggalKawin: DateTime.parse(json["tanggal_kawin"]),
        aktaKawin: json["akta_kawin"],
        tempatKawin: json["tempat_kawin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_kawin": "${tanggalKawin.year.toString().padLeft(4, '0')}-${tanggalKawin.month.toString().padLeft(2, '0')}-${tanggalKawin.day.toString().padLeft(2, '0')}",
        "akta_kawin": aktaKawin,
        "tempat_kawin": tempatKawin,
    };
}
