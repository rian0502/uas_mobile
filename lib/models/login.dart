

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
  String? type;
  String? token;
  Data({this.type, this.token});

  Data.fromJson(Map<String, dynamic> json){
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['token'] = this.token;
    return data;
  }


  Data.fromMap(Map<String, dynamic> map){
    type = map['type'];
    token = map['token'];
  }
  Data.toJson(Map<String, dynamic> json){
    type = json['type'];
    token = json['token'];
  }
  Data.toMap(Map<String, dynamic> map){
    type = map['type'];
    token = map['token'];
  }

}