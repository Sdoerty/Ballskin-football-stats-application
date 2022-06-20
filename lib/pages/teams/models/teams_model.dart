import 'package:json_annotation/json_annotation.dart';
part 'teams_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Teams {
  Teams({
    required this.team,
    required this.venue,
  });

  Team team;
  Venue venue;

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable()
class Team {
  Team({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  int id;
  String name;
  String code;
  String country;
  int founded;
  bool national;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  int id;
  String name;
  String address;
  String city;
  int capacity;
  String surface;
  String image;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}