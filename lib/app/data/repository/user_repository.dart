import 'package:firebase_auth/firebase_auth.dart';
import 'package:examplearch/app/data/model/call_state/call_state.dart';
import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/data/model/enums/language_enum.dart';
import 'package:examplearch/app/data/model/user/login.dart';
import 'package:examplearch/app/data/service/auth_service.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class UserRepository {
  Future<CallState> signinGoogle();
  Future<CallState> saveUserInfo(User user);
  Future<CallState> signout();
  Future<CallState> getUserData();
  Future<CallState> updateUserInfoField(String key, dynamic value);
}

@Environment(Environment.dev)
@Environment(Environment.prod)
@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final AuthService _authService;
  final LocalDataSource _localDatasource;
  UserRepositoryImpl(this._authService, this._localDatasource);
  @override
  Future<CallState> signinGoogle() async {
    try {
      var user = await _authService.signInWithGoogle();
      if (user != null) {
        return Success<User>(data: user);
      } else {
        return Error(message: "User not found");
      }
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  @override
  Future<CallState> saveUserInfo(User user) async {
    try {
      await _authService.saveUserInfo(user);
      return Success<bool>(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  @override
  Future<CallState> signout() async {
    try {
      await _authService.signOut();
      return Success<dynamic>(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  @override
  Future<CallState> getUserData() async {
    try {
      LoginResponse? user = await _authService.getUserData();
      await _localDatasource.setLoginResponse(user);
      if (user != null) {
        return Success<LoginResponse>(data: user);
      } else {
        return Error(message: "User not found");
      }
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  @override
  Future<CallState> updateUserInfoField(String key, dynamic value) async {
    try {
      LoginResponse? user = _localDatasource.loginResponse;

      user = user?.updateField(key, value);
      await _localDatasource.setLoginResponse(user);
      if (value is Gender) {
        value = value.name;
      }
      if (value is Language) {
        value = value.name;
      }
      await _authService.updateUserInfoField(key, value);
      return Success<dynamic>(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }
}
