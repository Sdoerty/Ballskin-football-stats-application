// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leagues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      json['leagueId'] as int,
      json['name'] as String,
      json['type'] as String,
      json['country'] as String,
      json['countryCode'] as String,
      json['season'] as int,
      json['seasonStart'] as String,
      json['seasonEnd'] as String,
      json['logo'] as String,
      json['flag'] as String,
      json['standings'] as int,
      json['isCurrent'] as int,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'leagueId': instance.leagueId,
      'name': instance.name,
      'type': instance.type,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'season': instance.season,
      'seasonStart': instance.seasonStart,
      'seasonEnd': instance.seasonEnd,
      'logo': instance.logo,
      'flag': instance.flag,
      'standings': instance.standings,
      'isCurrent': instance.isCurrent,
    };
