// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/services/user_api.dart';

class AuthController extends GetxController {
  final UserAPI _userAPI = UserAPI();

  Rx<AppUser> _appUser = AppUser().obs;

  AppUser get appUser => this._appUser.value;
  Rx<AuthStatus> _authStatus = AuthStatus.loadingResources.obs;

  AuthStatus get authStatus => _authStatus.value;

  set authStatus(AuthStatus authStatus) => _authStatus.value = authStatus;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Get.offAllNamed(Routes.signIn);
      }
    });
    super.onInit();
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;

  signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      _authStatus.value = AuthStatus.loadingResources;
      await verifyUser();
      Get.offNamed(Routes.initial);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<bool> registerUser(AppUser appUser, String password) async {
    bool isCreated = false;
    if (appUser != null) {
      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: appUser.email.toString(),
          password: password,
        );
        log(userCredential.toString());
        appUser.uid= userCredential.user?.uid;
        isCreated = await _userAPI.createUser(appUser);
        signInUser(appUser.email.toString(), password);
        return isCreated;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          log('The account already exists for that email.');
        }
        return isCreated;
      } catch (e) {
        log(e.toString());
        return isCreated;
      }
    }
    return isCreated;
  }

  Future verifyUser() async {
    log('${_authStatus.value} this is the value');
    log('$currentUser this is the user');
    if (currentUser != null) {
      _appUser.value.uid = currentUser?.uid;
      _appUser.value.email = currentUser?.email;
      final user = await _userAPI.getUserByUid(_appUser.value.uid.toString());
      log('this is a email', error: {currentUser?.email});
      if (user != null) {
        if (user.active == false) {
          signOut();
        } else {
          log('this is the user ${currentUser?.email}');
          _appUser.value = AppUser(
            email: user.email,
            name: user.name,
            lastname: user.lastname,
          );
          _authStatus.value = AuthStatus.registered;
        }
      }
    } else {
      _authStatus.value = AuthStatus.unauthenticated;
      log('${_authStatus.value} new status');
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    _appUser.value = AppUser();
    _authStatus.value = AuthStatus.unauthenticated;
    log('USER IS OUT');
  }
}
