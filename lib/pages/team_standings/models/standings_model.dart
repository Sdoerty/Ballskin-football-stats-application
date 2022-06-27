// To parse this JSON data, do
//
//     final teamStandings = teamStandingsFromJson(jsonString);

import 'dart:convert';

List<TeamStandings> teamStandingsFromJson(String str) => List<TeamStandings>.from(json.decode(str).map((x) => TeamStandings.fromJson(x)));

String teamStandingsToJson(List<TeamStandings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamStandings {
  TeamStandings({
    required this.league,
  });

  League league;

  factory TeamStandings.fromJson(Map<String, dynamic> json) => TeamStandings(
    league: League.fromJson(json["league"]),
  );

  Map<String, dynamic> toJson() => {
    "league": league.toJson(),
  };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  Standings standings;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
    standings: Standings.fromJson(json["standings"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
    "standings": standings.toJson(),
  };
}

class Standings {
  Standings({
    required this.rank,
    required this.team,
  });

  int rank;
  Team team;

  factory Standings.fromJson(Map<String, dynamic> json) => Standings(
    rank: json["rank"],
    team: Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "team": team.toJson(),
  };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}
