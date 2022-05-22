import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  User(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  int userId;
  int id;
  String title;
  String body;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
