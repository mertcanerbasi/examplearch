import 'package:json_annotation/json_annotation.dart';

part 'app_remote_config.g.dart';

@JsonSerializable()
class AppRemoteConfig {
  final String? version;
  final String? forceUpdateMessage;
  final String? updateUrl;

  AppRemoteConfig({
    this.version,
    this.forceUpdateMessage,
    this.updateUrl,
  });

  factory AppRemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$AppRemoteConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppRemoteConfigToJson(this);
}
