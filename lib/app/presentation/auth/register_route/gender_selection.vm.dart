import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenderSelectionViewModel extends BaseViewModel {
  RegisterUserModel registerUserModel = RegisterUserModel.instance;
  Gender _selectedGender = RegisterUserModel.instance.gender;
  Gender get selectedGender => _selectedGender;
  void setselectedGender(Gender selectedGender) {
    RegisterUserModel.instance.gender = selectedGender;
    _selectedGender = selectedGender;
    notifyListeners();
  }
}
