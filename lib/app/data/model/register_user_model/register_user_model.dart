import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/data/model/enums/language_enum.dart';
import 'package:examplearch/app/data/model/user/login.dart';

class RegisterUserModel {
  // Private constructor
  RegisterUserModel._privateConstructor();

  // The single instance of the class
  static final RegisterUserModel _instance =
      RegisterUserModel._privateConstructor();

  // A method to get the single instance of the class
  static RegisterUserModel get instance => _instance;

  String name = "";
  int age = 25;
  Gender gender = Gender.female;
  int height = 175;
  int weight = 70;
  bool isPremium = false;
  bool notificationsEnabled = true;
  Language language = Language.english;

  void loginResponseToRegisterModel(LoginResponse response) {
    name = response.name;
    age = response.age;
    gender = response.gender;
    height = response.height;
    weight = response.weight;
    isPremium = response.isPremium;
    notificationsEnabled = response.notificationsEnabled;
    language = response.language;
  }

  // Example method
  void str() {
    print("Name : $name");
    print("Age : $age");
    print("Gender : $gender");
    print("Height : $height");
    print("Weight : $weight");
    print("isPremium $isPremium");
    print("Notifications Enabled $notificationsEnabled");
    print("Language $language");
  }
}
