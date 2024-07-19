import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:examplearch/app/data/model/register_user_model/register_user_model.dart';
import 'package:examplearch/app/data/model/user/login.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential.user;
  }

  Future<bool> checkUser(User user) async {
    DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _firestore.collection('users').doc(user.uid).get();
    return userDoc.exists;
  }

  Future<LoginResponse?> getUserData() async {
    if (currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(currentUser!.uid).get();
      if (userDoc.exists) {
        return LoginResponse.fromJson(userDoc.data()!);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> saveUserInfo(User user) async {
    // Check if the user already exists in Firestore
    final result = await checkUser(user);

    //if true then user already exists in firestore
    if (result == true) {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(currentUser!.uid).get();
      await getIt<LocalDataSource>()
          .setLoginResponse(LoginResponse.fromJson(userDoc.data()!));

      ;
    } else {
      await _firestore.collection('users').doc(user.uid).set({
        'name': RegisterUserModel.instance.name,
        'age': RegisterUserModel.instance.age,
        'gender': RegisterUserModel.instance.gender.name,
        'height': RegisterUserModel.instance.height,
        'weight': RegisterUserModel.instance.weight,
        'isPremium': RegisterUserModel.instance.isPremium,
        'notificationsEnabled': RegisterUserModel.instance.notificationsEnabled,
        'language': RegisterUserModel.instance.language.name,
        // Add other user details you want to save
      });
      await getIt<LocalDataSource>().setLoginResponse(LoginResponse(
        name: RegisterUserModel.instance.name,
        age: RegisterUserModel.instance.age,
        gender: RegisterUserModel.instance.gender,
        height: RegisterUserModel.instance.height,
        weight: RegisterUserModel.instance.weight,
        isPremium: RegisterUserModel.instance.isPremium,
        notificationsEnabled: RegisterUserModel.instance.notificationsEnabled,
        language: RegisterUserModel.instance.language,
      ));
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> updateUserInfoField(String key, dynamic value) async {
    // Reference to the user document in 'users' collection
    DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid);

    await userRef.update({
      key: value,
    });
  }
}
