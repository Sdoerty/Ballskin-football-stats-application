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
    required this.league,
  });

  List<League> league;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    league: List<League>.from(json["league"].map((x) => League.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "league": List<dynamic>.from(league.map((x) => x.toJson())),
  };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.countryId,
    required this.scores,
  });

  String id;
  String name;
  String countryId;
  String scores;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    scores: json["scores"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "scores": scores,
  };
}
