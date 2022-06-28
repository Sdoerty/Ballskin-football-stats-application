// To parse this JSON data, do
//
//     final fixturesData = fixturesDataFromJson(jsonString);

import 'dart:convert';

FixturesData fixturesDataFromJson(String str) => FixturesData.fromJson(json.decode(str));

String fixturesDataToJson(FixturesData data) => json.encode(data.toJson());

class FixturesData {
  FixturesData({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory FixturesData.fromJson(Map<String, dynamic> json) => FixturesData(
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
    required this.fixtures,
  });

  List<Fixture> fixtures;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    fixtures: List<Fixture>.from(json["fixtures"].map((x) => Fixture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fixtures": List<dynamic>.from(fixtures.map((x) => x.toJson())),
  };
}

class Fixture {
  Fixture({
    required this.location,
    required this.date,
    required this.awayId,
    required this.homeName,
    required this.awayTranslations,
    required this.competitionId,
    required this.competition,
    required this.id,
    required this.time,
    required this.homeId,
    required this.homeTranslations,
    required this.leagueId,
    required this.odds,
    required this.league,
    required this.round,
    required this.awayName,
    required this.h2H,
  });

  String location;
  DateTime date;
  int awayId;
  String homeName;
  Translations awayTranslations;
  int competitionId;
  Competition competition;
  int id;
  String time;
  int homeId;
  Translations homeTranslations;
  int leagueId;
  Odds odds;
  League league;
  String round;
  String awayName;
  String h2H;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
    location: json["location"],
    date: DateTime.parse(json["date"]),
    awayId: json["away_id"],
    homeName: json["home_name"],
    awayTranslations: Translations.fromJson(json["away_translations"]),
    competitionId: json["competition_id"],
    competition: Competition.fromJson(json["competition"]),
    id: json["id"],
    time: json["time"],
    homeId: json["home_id"],
    homeTranslations: Translations.fromJson(json["home_translations"]),
    leagueId: json["league_id"],
    odds: Odds.fromJson(json["odds"]),
    league: League.fromJson(json["league"]),
    round: json["round"],
    awayName: json["away_name"],
    h2H: json["h2h"],
  );

  Map<String, dynamic> toJson() => {
    "location": location,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "away_id": awayId,
    "home_name": homeName,
    "away_translations": awayTranslations.toJson(),
    "competition_id": competitionId,
    "competition": competition.toJson(),
    "id": id,
    "time": time,
    "home_id": homeId,
    "home_translations": homeTranslations.toJson(),
    "league_id": leagueId,
    "odds": odds.toJson(),
    "league": league.toJson(),
    "round": round,
    "away_name": awayName,
    "h2h": h2H,
  };
}

class Translations {
  Translations({
    required this.fa,
  });

  String fa;

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    fa: json["fa"],
  );

  Map<String, dynamic> toJson() => {
    "fa": fa,
  };
}

class Competition {
  Competition({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class League {
  League({
    required this.name,
    required this.id,
    required this.countryId,
  });

  String name;
  int id;
  int countryId;

  factory League.fromJson(Map<String, dynamic> json) => League(
    name: json["name"],
    id: json["id"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "country_id": countryId,
  };
}

class Odds {
  Odds({
    required this.live,
    required this.pre,
  });

  Live live;
  Live pre;

  factory Odds.fromJson(Map<String, dynamic> json) => Odds(
    live: Live.fromJson(json["live"]),
    pre: Live.fromJson(json["pre"]),
  );

  Map<String, dynamic> toJson() => {
    "live": live.toJson(),
    "pre": pre.toJson(),
  };
}

class Live {
  Live({
    this.the1,
    this.the2,
    this.x,
  });

  dynamic the1;
  dynamic the2;
  dynamic x;

  factory Live.fromJson(Map<String, dynamic> json) => Live(
    the1: json["1"],
    the2: json["2"],
    x: json["X"],
  );

  Map<String, dynamic> toJson() => {
    "1": the1,
    "2": the2,
    "X": x,
  };
}
