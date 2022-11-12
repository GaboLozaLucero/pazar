// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/services/user_service.dart';

class AuthController extends GetxController {
  final UserService _userService = UserService();

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

  Future<bool> signInUser(String email, String password) async {
    try {
      _authStatus.value = AuthStatus.loadingResources;
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      await verifyUser(); //verifies a user by retrieving their information
      Get.offNamed(Routes.initial);
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> registerUser(AppUser appUser, String password) async {
    bool isCreated = false;
    _authStatus.value = AuthStatus.loadingResources;
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: appUser.email.toString(),
        password: password,
      );
      log(userCredential.toString());
      appUser.uid = userCredential.user?.uid;
      isCreated = await _userService.createUser(appUser);
      signInUser(appUser.email.toString(), password);
      return isCreated;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      _authStatus.value = AuthStatus.unauthenticated;
      return isCreated;
    } catch (e) {
      log(e.toString());
      _authStatus.value = AuthStatus.unauthenticated;
      return isCreated;
    }
  }

  Future verifyUser() async {
    _authStatus.value = AuthStatus.loadingResources;
    log('${_authStatus.value} this is the value');
    log('$currentUser this is the user');
    if (currentUser != null) {
      _appUser.value.uid = currentUser?.uid;
      _appUser.value.email = currentUser?.email;
      final user = await _userService.getUserByUid(_appUser.value.uid.toString());
      log('this is a email', error: {currentUser?.email});
      if (user != null) {
        if (user.active == false) {
          signOut();
        } else {
          log('this is the user ${currentUser?.email}');
          _appUser.value = AppUser(
            uid: currentUser?.uid,
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
    _authStatus.value = AuthStatus.loadingResources;
    await FirebaseAuth.instance.signOut();
    _appUser.value = AppUser();
    _authStatus.value = AuthStatus.unauthenticated;
    log('USER IS OUT');
  }

  Future<bool> updateUser(AppUser _appUser)async{
    _authStatus.value = AuthStatus.loadingResources;
    bool result = await _userService.updateUser(_appUser);
    await verifyUser();
    return result;
  }
  
  Future changePassword(String newPassword) async{
    await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
  }
}
