// To parse this JSON data, do
//
//     final getDataModel = getDataModelFromJson(jsonString);

import 'dart:convert';

GetDataModel getDataModelFromJson(String str) =>
    GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  String? message;
  List<Person>? people;
  int? number;

  GetDataModel({
    required this.message,
    required this.people,
    required this.number,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        message: json["message"],
        people:
            List<Person>.from(json["people"].map((x) => Person.fromJson(x))),
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "people": List<dynamic>.from(people!.map((x) => x.toJson())),
        "number": number,
      };
}

class Person {
  String name;
  String craft;

  Person({
    required this.name,
    required this.craft,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        craft: json["craft"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "craft": craft,
      };
}
