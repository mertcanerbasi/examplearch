import 'package:flutter/material.dart';
import 'package:examplearch/app/data/model/user/login.dart';
import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/app/presentation/home/home.dart';
import 'package:examplearch/app/presentation/profile/profile.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class RootPageViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  RootPageViewModel(this._userRepository);
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setcurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  void changePage(int index) {
    setcurrentIndex(index);
  }

  List<Widget> pages = [
    HomePage(),
    Container(
      color: AppColors.backgroundColor,
    ),
    Container(
      color: AppColors.backgroundColor,
    ),
    Container(
      color: AppColors.backgroundColor,
    ),
    ProfilePage(),
  ];

  Future<LoginResponse?> getUserData() async {
    return await handleResponse(() => _userRepository.getUserData());
  }
}
