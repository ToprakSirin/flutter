class Ogrenci {
  //tabloda tutulacak öğrenci bilgileri
  int? _id;
  String? _isim;
  int? _aktif;

  int get id => _id!;

  set id(int value) {
    _id = value;
  }

  String get isim => _isim!;

  set isim(String value) {
    _isim = value;
  }

  int get aktif => _aktif!;

  set aktif(int value) {
    _aktif = value;
  }

  Ogrenci(this._isim, );
  Ogrenci.withID(this._id, this._isim, );

//objeyi mape dönüştürme => Değer Yazdırmak için veritabanına

  Map<String, dynamic> dbyeYazmakIcinMapeDonustur() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['isim'] = _isim;
    map['aktif'] = _aktif;
    return map;
  }

//var olan  mapi objeye dönüştürme. Veritabanından veri okumak için
  Ogrenci.dbdenOkudugunMapiObjeyeDonustur(Map<String, dynamic> map) {
    this._id = map['id'];
    this._isim = map['isim'];
    this._aktif = map['aktif'];
  }
  @override
  String toString() => 'Ogrenci(_id: $_id, _isim: $_isim, _aktif: $_aktif)';
}
