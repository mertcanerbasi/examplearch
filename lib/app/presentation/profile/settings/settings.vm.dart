import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/app/presentation/app/app.vm.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  final UserRepository _userRepository;
  SettingsViewModel(this._localDataSource, this._userRepository);
  late bool _notificationSettings =
      _localDataSource.loginResponse!.notificationsEnabled;
  bool get notificationSettings => _notificationSettings;
  void setnotificationSettings(bool notificationSettings) {
    _notificationSettings = notificationSettings;
    notifyListeners();
  }

  String get currentLanguageCode => _localDataSource.languageCode ?? "en";

  Future<void> changeLocaleLanguage(int index) async {
    String languageCode = "en"; // Default language code

    switch (index) {
      case 0:
        languageCode = "tr";
        break;
      case 1:
        languageCode = "en";
        break;
      case 2:
        languageCode = "es_TR";
        break;
      default:
        languageCode = "en"; // Handle default case
    }

    await _localDataSource.setLanguageCode(languageCode);
    getIt<AppViewModel>().notifyListeners();
  }

  Future<dynamic> logout() async {
    await _localDataSource.setLoginResponse(null);
    return await handleResponse(() => _userRepository.signout());
  }

  Future<dynamic> changeValueOf(String key, dynamic value) async {
    return await handleResponse(
        () => _userRepository.updateUserInfoField(key, value)).then(
      (value) {
        notifyListeners();
      },
    );
  }
}
