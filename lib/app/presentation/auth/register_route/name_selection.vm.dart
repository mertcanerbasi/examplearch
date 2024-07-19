import 'package:flutter/material.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class NameSelectionViewModel extends BaseViewModel {
  NameSelectionViewModel() {}

  RegisterUserModel registerUserModel = RegisterUserModel.instance;

  TextEditingController nameController = TextEditingController();

  bool _isButtonEnabled = false;
  bool get isButtonEnabled => _isButtonEnabled;
  void setisButtonEnabled(bool isButtonEnabled) {
    _isButtonEnabled = isButtonEnabled;
    notifyListeners();
  }
}
