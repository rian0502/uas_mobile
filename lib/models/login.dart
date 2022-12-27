import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));


class Login{
  bool? status;
  String? message;
  Data? data;
  double? latency;
  Login({this.status, this.message, this.latency, this.data});
  //from json
  Login.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    latency = json['latency'];
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;

    map['latency'] = latency;
    return map;

  }
  Login.fromMap(Map<String, dynamic> map){
    status = map['status'];
    message = map['message'];
    data = map['data'] != null ? Data.fromMap(map['data']) : null;
    latency = map['latency'];
  }
  Login.toJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    latency = json['latency'];
  }


}
class Data{
  String? tokenStatus;
  String? tokenDibuat;
  String? tokenKadarluwasa;
  String? tokenBearer;

  Data(
      {this.tokenStatus,
        this.tokenDibuat,
        this.tokenKadarluwasa,
        this.tokenBearer});

  Data.fromJson(Map<String, dynamic> json) {
    tokenStatus = json['token_status'];
    tokenDibuat = json['token_dibuat'];
    tokenKadarluwasa = json['token_kadarluwasa'];
    tokenBearer = json['token_bearer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_status'] = tokenStatus;
    data['token_dibuat'] = tokenDibuat;
    data['token_kadarluwasa'] = tokenKadarluwasa;
    data['token_bearer'] = tokenBearer;
    return data;
  }

  Data.fromMap(Map<String, dynamic> map){
    tokenStatus = map['token_status'];
    tokenDibuat = map['token_dibuat'];
    tokenKadarluwasa = map['token_kadarluwasa'];
    tokenBearer = map['token_bearer'];
  }
}