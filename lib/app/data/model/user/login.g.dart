// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      isPremium: json['isPremium'] as bool,
      language: $enumDecode(_$LanguageEnumMap, json['language']),
      notificationsEnabled: json['notificationsEnabled'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender]!,
      'height': instance.height,
      'weight': instance.weight,
      'isPremium': instance.isPremium,
      'notificationsEnabled': instance.notificationsEnabled,
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$LanguageEnumMap = {
  Language.turkish: 'turkish',
  Language.english: 'english',
  Language.spanish: 'spanish',
};
