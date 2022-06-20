// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teams _$TeamsFromJson(Map<String, dynamic> json) => Teams(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      venue: Venue.fromJson(json['venue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'team': instance.team.toJson(),
      'venue': instance.venue.toJson(),
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      country: json['country'] as String,
      founded: json['founded'] as int,
      national: json['national'] as bool,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'country': instance.country,
      'founded': instance.founded,
      'national': instance.national,
      'logo': instance.logo,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      capacity: json['capacity'] as int,
      surface: json['surface'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'capacity': instance.capacity,
      'surface': instance.surface,
      'image': instance.image,
    };
