// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

List<UserModel> userModelFromMap(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromMap(x)));

String userModelToMap(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserModel {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;

  UserModel({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: json["name"] == null ? null : Name.fromMap(json["name"]),
    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "address": address?.toMap(),
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name?.toMap(),
    "phone": phone,
    "__v": v,
  };
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    geolocation: json["geolocation"] == null ? null : Geolocation.fromMap(json["geolocation"]),
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toMap() => {
    "geolocation": geolocation?.toMap(),
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
  };
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({
    this.lat,
    this.long,
  });

  factory Geolocation.fromMap(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "long": long,
  };
}

class Name {
  String? firstname;
  String? lastname;

  Name({
    this.firstname,
    this.lastname,
  });

  factory Name.fromMap(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toMap() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
