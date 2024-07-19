import 'package:examplearch/app/data/model/enums/bmi_range.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeightSelectionViewModel extends BaseViewModel {
  WeightSelectionViewModel() {}

  RegisterUserModel registerUserModel = RegisterUserModel.instance;
  int _weight = RegisterUserModel.instance.weight;
  int get weight => _weight;
  void setweight(int weight) {
    _weight = weight;
    registerUserModel.weight = weight;
    notifyListeners();
  }

  double get bmi {
    var height = registerUserModel.height / 100;
    return _weight / (height * height);
  }

  BmiRange getBmiRange() {
    if (bmi < 18.5) {
      return BmiRange.low;
    } else if (18.5 <= bmi && bmi < 24.9) {
      return BmiRange.normal;
    } else if (25.0 <= bmi && bmi < 29.9) {
      return BmiRange.overweight;
    } else if (30 <= bmi && bmi < 34.9) {
      return BmiRange.obese1;
    } else if (35 <= bmi && bmi < 39.9) {
      return BmiRange.obese2;
    } else {
      return BmiRange.obese3;
    }
  }

  double get lowWeightLimit {
    var height = registerUserModel.height / 100;
    return 18.5 * (height * height);
  }

  double get highWeightLimit {
    var height = registerUserModel.height / 100;
    return 24.9 * (height * height);
  }
}
