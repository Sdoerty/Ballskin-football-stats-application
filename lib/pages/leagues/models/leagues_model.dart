// To parse this JSON data, do
//
//     final leagueData = leagueDataFromJson(jsonString);

import 'dart:convert';

LeagueData leagueDataFromJson(String str) => LeagueData.fromJson(json.decode(str));

String leagueDataToJson(LeagueData data) => json.encode(data.toJson());

class LeagueData {
  LeagueData({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory LeagueData.fromJson(Map<String, dynamic> json) => LeagueData(
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
    required this.competition,
  });

  List<Competition> competition;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    competition: List<Competition>.from(json["competition"].map((x) => Competition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "competition": List<dynamic>.from(competition.map((x) => x.toJson())),
  };
}

class Competition {
  Competition({
    required this.id,
    required this.name,
    required this.countries,
    required this.federations,
    required this.season,
  });

  String id;
  String name;
  List<Country> countries;
  List<dynamic> federations;
  Season season;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    id: json["id"],
    name: json["name"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    federations: List<dynamic>.from(json["federations"].map((x) => x)),
    season: Season.fromJson(json["season"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "federations": List<dynamic>.from(federations.map((x) => x)),
    "season": season.toJson(),
  };
}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.flag,
    required this.fifaCode,
    required this.uefaCode,
    required this.isReal,
  });

  String id;
  String name;
  String flag;
  String fifaCode;
  String uefaCode;
  String isReal;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    flag: json["flag"],
    fifaCode: json["fifa_code"],
    uefaCode: json["uefa_code"],
    isReal: json["is_real"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flag": flag,
    "fifa_code": fifaCode,
    "uefa_code": uefaCode,
    "is_real": isReal,
  };
}

class Season {
  Season({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
  });

  String id;
  String name;
  DateTime start;
  DateTime end;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    id: json["id"],
    name: json["name"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end": "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
  };
}
