// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

CountryData countryDataFromJson(String str) => CountryData.fromJson(json.decode(str));

String countryDataToJson(CountryData data) => json.encode(data.toJson());

class CountryData {
  CountryData({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.country,
  });

  List<Country> country;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.isReal,
    required this.leagues,
    required this.scores,
    required this.federation,
    required this.nationalTeam,
  });

  String id;
  String name;
  String isReal;
  String leagues;
  String scores;
  Federation federation;
  NationalTeam nationalTeam;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    isReal: json["is_real"],
    leagues: json["leagues"],
    scores: json["scores"],
    federation: Federation.fromJson(json["federation"]),
    nationalTeam: NationalTeam.fromJson(json["national_team"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_real": isReal,
    "leagues": leagues,
    "scores": scores,
    "federation": federation.toJson(),
    "national_team": nationalTeam.toJson(),
  };
}

class Federation {
  Federation({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Federation.fromJson(Map<String, dynamic> json) => Federation(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class NationalTeam {
  NationalTeam({
    required this.id,
    required this.name,
    required this.stadium,
    required this.location,
  });

  String id;
  String name;
  String stadium;
  String location;

  factory NationalTeam.fromJson(Map<String, dynamic> json) => NationalTeam(
    id: json["id"],
    name: json["name"],
    stadium: json["stadium"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "stadium": stadium,
    "location": location,
  };
}
