import 'package:json_annotation/json_annotation.dart';

part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;

  CountriesModel(
    this.id,
    this.name,
    this.code,
    this.flag,
  );

  factory CountriesModel.fromJson(Map<String, dynamic> json) => _$CountriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);

}
