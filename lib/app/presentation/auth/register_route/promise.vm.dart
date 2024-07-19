import 'package:firebase_auth/firebase_auth.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class PromiseViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  PromiseViewModel(this._userRepository);

  RegisterUserModel registerUserModel = RegisterUserModel.instance;

  Future<void> saveUserInfo(User user) async {
    await handleResponse(() => _userRepository.saveUserInfo(user));
  }
}
