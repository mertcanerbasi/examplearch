// Flutter imports:
import 'package:examplearch/app/data/repository/user_repository.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/util/response_type_checker.dart';
// Package imports:
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  HomeViewModel(this._userRepository);

  Future<void> signout() async {
    return await handleResponse(() => _userRepository.signout());
  }
}
