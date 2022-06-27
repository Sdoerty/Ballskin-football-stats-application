// To parse this JSON data, do
//
//     final standingsData = standingsDataFromJson(jsonString);

import 'dart:convert';

StandingsData standingsDataFromJson(String str) => StandingsData.fromJson(json.decode(str));

String standingsDataToJson(StandingsData data) => json.encode(data.toJson());

class StandingsData {
  StandingsData({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory StandingsData.fromJson(Map<String, dynamic> json) => StandingsData(
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
    required this.table,
  });

  List<Table> table;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    table: List<Table>.from(json["table"].map((x) => Table.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "table": List<dynamic>.from(table.map((x) => x.toJson())),
  };
}

class Table {
  Table({
    required this.leagueId,
    required this.seasonId,
    required this.name,
    required this.rank,
    required this.points,
    required this.matches,
    required this.goalDiff,
    required this.goalsScored,
    required this.goalsConceded,
    required this.lost,
    required this.drawn,
    required this.won,
    required this.teamId,
    required this.competitionId,
    required this.groupId,
    required this.groupName,
    required this.stageName,
    required this.stageId,
  });

  String leagueId;
  String seasonId;
  String name;
  String rank;
  String points;
  String matches;
  String goalDiff;
  String goalsScored;
  String goalsConceded;
  String lost;
  String drawn;
  String won;
  String teamId;
  String competitionId;
  String groupId;
  String groupName;
  String stageName;
  String stageId;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    name: json["name"],
    rank: json["rank"],
    points: json["points"],
    matches: json["matches"],
    goalDiff: json["goal_diff"],
    goalsScored: json["goals_scored"],
    goalsConceded: json["goals_conceded"],
    lost: json["lost"],
    drawn: json["drawn"],
    won: json["won"],
    teamId: json["team_id"],
    competitionId: json["competition_id"],
    groupId: json["group_id"],
    groupName: json["group_name"],
    stageName: json["stage_name"],
    stageId: json["stage_id"],
  );

  Map<String, dynamic> toJson() => {
    "league_id": leagueId,
    "season_id": seasonId,
    "name": name,
    "rank": rank,
    "points": points,
    "matches": matches,
    "goal_diff": goalDiff,
    "goals_scored": goalsScored,
    "goals_conceded": goalsConceded,
    "lost": lost,
    "drawn": drawn,
    "won": won,
    "team_id": teamId,
    "competition_id": competitionId,
    "group_id": groupId,
    "group_name": groupName,
    "stage_name": stageName,
    "stage_id": stageId,
  };
}
