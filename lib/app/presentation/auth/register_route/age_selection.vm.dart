import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgeSelectionViewModel extends BaseViewModel {
  AgeSelectionViewModel() {}

  RegisterUserModel registerUserModel = RegisterUserModel.instance;
}
