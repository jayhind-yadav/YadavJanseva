/// sn : 2223
/// name : "jk"
/// fname : "jk"
/// address : "j"
/// date : "2020-02-03"
/// income : 201900010017336
/// ii : "N"
/// cast : 201900030009870
/// ic : "N"
/// domicile : 201900020014034
/// id : "N"
/// am : 0

class CustModal {
  CustModal({
      String? sn,
      String? mobile,
      String? name, 
      String? fname, 
      String? address, 
      String? date, 
      String? income, 
      String? ii, 
      String? cast, 
      String? ic, 
      String? domicile, 
      String? id, 
      String? am,}){
    _sn = sn;
    _mobile = mobile;
    _name = name;
    _fname = fname;
    _address = address;
    _date = date;
    _income = income;
    _ii = ii;
    _cast = cast;
    _ic = ic;
    _domicile = domicile;
    _id = id;
    _am = am;
}

  CustModal.fromJson(dynamic json) {
    _sn = json['sn'];
    _mobile = json['mobile'];
    _name = json['name'];
    _fname = json['fname'];
    _address = json['address'];
    _date = json['date'];
    _income = json['income'];
    _ii = json['ii'];
    _cast = json['cast'];
    _ic = json['ic'];
    _domicile = json['domicile'];
    _id = json['id'];
    _am = json['am'];
  }
  String? _sn;
  String? _mobile;
  String? _name;
  String? _fname;
  String? _address;
  String? _date;
  String? _income;
  String? _ii;
  String? _cast;
  String? _ic;
  String? _domicile;
  String? _id;
  String? _am;

  String? get sn => _sn;
  String? get mobile=> _mobile;
  String? get name => _name;
  String? get fname => _fname;
  String? get address => _address;
  String? get date => _date;
  String? get income => _income;
  String? get ii => _ii;
  String? get cast => _cast;
  String? get ic => _ic;
  String? get domicile => _domicile;
  String? get id => _id;
  String? get am => _am;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sn'] = _sn;
    map['mobile'] = _mobile;
    map['name'] = _name;
    map['fname'] = _fname;
    map['address'] = _address;
    map['date'] = _date;
    map['income'] = _income;
    map['ii'] = _ii;
    map['cast'] = _cast;
    map['ic'] = _ic;
    map['domicile'] = _domicile;
    map['id'] = _id;
    map['am'] = _am;
    return map;
  }

}