import 'package:json_annotation/json_annotation.dart';

part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  CountriesModel(
    this.id,
    this.name,
    this.code,
    this.flag,
  );

  int id;
  String name;
  String code;
  String flag;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => _$CountriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);

}
