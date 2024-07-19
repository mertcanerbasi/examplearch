// Package imports:
import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/data/model/enums/language_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.isPremium,
    required this.language,
    required this.notificationsEnabled,
  });

  String name;
  int age;
  Gender gender;
  int height;
  int weight;
  bool isPremium;
  bool notificationsEnabled;
  Language language;

  LoginResponse updateField(String key, dynamic value) {
    switch (key) {
      case 'name':
        return LoginResponse(
          name: value as String,
          age: this.age,
          gender: this.gender,
          height: this.height,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );
      case 'age':
        return LoginResponse(
          name: this.name,
          age: value as int,
          gender: this.gender,
          height: this.height,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );
      case 'gender':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: value as Gender,
          height: this.height,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );
      case 'height':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: this.gender,
          height: value as int,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );
      case 'weight':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: this.gender,
          height: this.height,
          weight: value as int,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );

      case 'isPremium':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: this.gender,
          height: this.height,
          weight: this.weight,
          isPremium: value as bool,
          notificationsEnabled: this.notificationsEnabled,
          language: this.language,
        );
      case 'notificationsEnabled':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: this.gender,
          height: this.height,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: value as bool,
          language: this.language,
        );
      case 'language':
        return LoginResponse(
          name: this.name,
          age: this.age,
          gender: this.gender,
          height: this.height,
          weight: this.weight,
          isPremium: this.isPremium,
          notificationsEnabled: this.notificationsEnabled,
          language: value as Language,
        );
      default:
        // Return current instance if key doesn't match any field
        return this;
    }
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
