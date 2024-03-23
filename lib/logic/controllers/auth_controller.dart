import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/storage_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/view/functions/snackbar_utils.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;

  void changeVisibility() {
    isVisibility = !isVisibility;
    update();
  }

  void changeCheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  final AppStorage _appStorage = AppStorage(GetStorage());

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          _appStorage.setUserInBox(true);
          update();
        },
      );
      Get.offNamed(Routes.mainRoute);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == AppStrings.weakPassword) {
        message = AppStrings.providedPasswordIsTooWeak;
      } else if (error.code == AppStrings.emailAlreadyInUse) {
        message = AppStrings.accountAlreadyExistsForThatEmail;
      } else {
        message = error.message.toString();
      }
      snackBarUtils(title, message);
    } catch (error) {
      snackBarUtils(AppStrings.error, error.toString());
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          _appStorage.setUserInBox(true);
          update();
        },
      );
      Get.offNamed(Routes.mainRoute);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == AppStrings.userNotFound) {
        message = AppStrings.accountNotFound;
      } else if (error.code == AppStrings.wrongPassword) {
        message = AppStrings.invalidPassword;
      } else {
        message = error.message.toString();
      }
      snackBarUtils(title, message);
    } catch (error) {
      snackBarUtils(AppStrings.error, error.toString());
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      _appStorage.removeUserFromBox();
      update();
      Get.offNamed(Routes.onBoardingRoute);
    } catch (error) {
      snackBarUtils(AppStrings.error, error.toString());
    }
  }

  void googleSignInUsingFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );
      await auth.signInWithCredential(credential);
      _appStorage.setUserInBox(true);
      update();
      Get.offNamed(Routes.mainRoute);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      snackBarUtils(AppStrings.error, error.toString());
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == AppStrings.userNotFound) {
        message = AppStrings.accountNotFound;
      } else {
        message = error.message.toString();
      }
      snackBarUtils(title, message);
    } catch (error) {
      snackBarUtils(AppStrings.error, error.toString());
    }
  }
}
