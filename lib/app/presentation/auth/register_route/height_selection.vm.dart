import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HeightSelectionViewModel extends BaseViewModel {
  HeightSelectionViewModel() {}

  RegisterUserModel registerUserModel = RegisterUserModel.instance;
}
