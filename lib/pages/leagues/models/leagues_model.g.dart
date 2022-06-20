// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leagues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leagues _$LeaguesFromJson(Map<String, dynamic> json) => Leagues(
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaguesToJson(Leagues instance) => <String, dynamic>{
      'league': instance.league.toJson(),
      'country': instance.country.toJson(),
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };
