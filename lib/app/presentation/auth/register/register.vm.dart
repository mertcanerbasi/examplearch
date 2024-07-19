import 'package:firebase_auth/firebase_auth.dart';
import 'package:examplearch/app/data/model/call_state/call_state.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  RegisterViewModel(this._userRepository);

  RegisterUserModel registerUserModel = RegisterUserModel.instance;

  Future<User?> signinGoogle() async {
    var response = await _userRepository.signinGoogle();
    if (response is Success) {
      return response.data;
    } else {
      throw "${response.message}";
    }
  }

  Future<void> saveUserInfo(User user) async {
    return await handleResponse(() => _userRepository.saveUserInfo(user));
  }
}
