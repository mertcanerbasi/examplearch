import 'package:flutter/material.dart';
import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/data/model/user/login.dart';
import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  final LocalDataSource _localDataSource;
  ProfileViewModel(this._userRepository, this._localDataSource);

  LoginResponse? get userInfo => _localDataSource.loginResponse;

  Future<dynamic> changeValueOf(String key, dynamic value) async {
    return await handleResponse(
        () => _userRepository.updateUserInfoField(key, value)).then(
      (value) {
        notifyListeners();
      },
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  Gender? _currentGender;
  Gender? get currentGender => _currentGender;
  void setcurrentGender(Gender? currentGender) {
    _currentGender = currentGender;
    notifyListeners();
  }
}
