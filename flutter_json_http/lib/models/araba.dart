
class Araba {
  String? arabaAdi;
  String? ulke;
  int? kurulusTarihi;
  List<Model>? model;

  Araba({this.arabaAdi, this.ulke, this.kurulusTarihi, this.model});

  Araba.fromJson(Map<String, dynamic> json) {
    if(json["araba_adi"] is String)
      this.arabaAdi = json["araba_adi"];
    if(json["ulke"] is String)
      this.ulke = json["ulke"];
    if(json["kurulus_tarihi"] is int)
      this.kurulusTarihi = json["kurulus_tarihi"];
    if(json["model"] is List)
      this.model = json["model"]==null ? null : (json["model"] as List).map((e)=>Model.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["araba_adi"] = this.arabaAdi;
    data["ulke"] = this.ulke;
    data["kurulus_tarihi"] = this.kurulusTarihi;
    if(this.model != null)
      data["model"] = this.model!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Model {
  String? modelAdi;
  int? fiyat;
  bool? benzinli;

  Model({this.modelAdi, this.fiyat, this.benzinli});

  Model.fromJson(Map<String, dynamic> json) {
    if(json["model_adi"] is String)
      this.modelAdi = json["model_adi"];
    if(json["fiyat"] is int)
      this.fiyat = json["fiyat"];
    if(json["benzinli"] is bool)
      this.benzinli = json["benzinli"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["model_adi"] = this.modelAdi;
    data["fiyat"] = this.fiyat;
    data["benzinli"] = this.benzinli;
    return data;
  }
}