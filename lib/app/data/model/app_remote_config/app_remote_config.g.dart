// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRemoteConfig _$AppRemoteConfigFromJson(Map<String, dynamic> json) =>
    AppRemoteConfig(
      version: json['version'] as String?,
      forceUpdateMessage: json['forceUpdateMessage'] as String?,
      updateUrl: json['updateUrl'] as String?,
    );

Map<String, dynamic> _$AppRemoteConfigToJson(AppRemoteConfig instance) =>
    <String, dynamic>{
      'version': instance.version,
      'forceUpdateMessage': instance.forceUpdateMessage,
      'updateUrl': instance.updateUrl,
    };
