import 'package:json_annotation/json_annotation.dart';
part 'leagues_model.g.dart';

@JsonSerializable()
class League {
  int leagueId;
  String name;
  String type;
  String country;
  String countryCode;
  int season;
  String seasonStart;
  String seasonEnd;
  String logo;
  String flag;
  int standings;
  int isCurrent;

  League(
      this.leagueId,
        this.name,
        this.type,
        this.country,
        this.countryCode,
        this.season,
        this.seasonStart,
        this.seasonEnd,
        this.logo,
        this.flag,
        this.standings,
        this.isCurrent);

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);


}

