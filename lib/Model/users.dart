import 'package:flutter/material.dart';

class UsersInfo with ChangeNotifier {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  String street;
  String suite;
  String city;
  String zipcode;
  String lat;
  String lng;
  String companyName;
  String catchPhrase;
  String bs;

  UsersInfo({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.lat,
    this.lng,
    this.companyName,
    this.catchPhrase,
    this.bs,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "email": email,
      "username": username,
      "phone": phone,
      "website": website,
      "street": street,
      "suite": suite,
      "city": city,
      "zipcode": zipcode,
      "lat": lat,
      "lng": lng,
      "companyName": companyName,
      "catchPhrase": catchPhrase,
      "bs": bs,
    };
  }

  UsersInfo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    username = map['username'];
    website = map['website'];
    street = map["street"];
    suite = map["suite"];
    city = map["city"];
    zipcode = map["zipcode"];
    lat = map["lat"];
    lng = map["lng"];
    companyName = map["companyName"];
    catchPhrase = map["catchPhrase"];
    bs = map["bs"];
  }
}