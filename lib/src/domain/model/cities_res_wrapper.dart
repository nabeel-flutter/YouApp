/// status : true
/// code : 200
/// message : ""
/// data : [{"id":1,"translation_of":null,"lang_id":1,"sequence":1,
/// "name":"Karachi","slug":"karachi","status":true},
/// {"id":2,"translation_of":null,"lang_id":1,"sequence":2,
/// "name":"Lahore","slug":"lahore","status":true}]

class CitiesResWrapper {
  CitiesResWrapper({
    bool? status,
    int? code,
    String? message,
    List<City>? data,
  }) {
    _status = status;
    _code = code;
    _message = message;
    _data = data;
  }

  CitiesResWrapper.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(City.fromJson(v));
      });
    }
  }

  bool? _status;
  int? _code;
  String? _message;
  List<City>? _data;

  bool? get status => _status;

  int? get code => _code;

  String? get message => _message;

  List<City>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// translation_of : null
/// lang_id : 1
/// sequence : 1
/// name : "Karachi"
/// slug : "karachi"
/// status : true

class City {
  City({
    int? id,
    dynamic translationOf,
    int? langId,
    int? sequence,
    String? name,
    String? slug,
    bool? status,
  }) {
    _id = id;
    _translationOf = translationOf;
    _langId = langId;
    _sequence = sequence;
    _name = name;
    _slug = slug;
    _status = status;
  }

  City.fromJson(dynamic json) {
    _id = json['id'];
    _translationOf = json['translation_of'];
    _langId = json['lang_id'];
    _sequence = json['sequence'];
    _name = json['name'];
    _slug = json['slug'];
    _status = json['status'];
  }

  dynamic _id;
  dynamic _translationOf;
  int? _langId;
  int? _sequence;
  String? _name;
  String? _slug;
  bool? _status;

  int? get id => _id;

  dynamic get translationOf => _translationOf;

  int? get langId => _langId;

  int? get sequence => _sequence;

  String? get name => _name;

  String? get slug => _slug;

  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['translation_of'] = _translationOf;
    map['lang_id'] = _langId;
    map['sequence'] = _sequence;
    map['name'] = _name;
    map['slug'] = _slug;
    map['status'] = _status;
    return map;
  }
}
