import 'package:json_annotation/json_annotation.dart';
part 'leagues_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Leagues {
  Leagues({
    required this.league,
    required this.country,
  });

  League league;
  Country country;

  factory Leagues.fromJson(Map<String, dynamic> json) => _$LeaguesFromJson(json);
  Map<String, dynamic> toJson() => _$LeaguesToJson(this);
}

@JsonSerializable()
class League {
  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  int id;
  String name;
  String type;
  String logo;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class Country {
  Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  String name;
  final String? code;
  final String? flag;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}



