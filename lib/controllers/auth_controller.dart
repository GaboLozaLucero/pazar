import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/enum/auth_status.dart';
import 'package:project/data/models/app_user.dart';

class AuthController extends GetxController{
  late FirebaseAuth _firebaseAuth;
  Rx<AppUser> _appUser = AppUser().obs;
  AppUser get appUser => this._appUser.value;
  Rx<AuthStatus> _authStatus = AuthStatus.loadingResources.obs;
  AuthStatus get authStatus => _authStatus.value;
  set authStatus(AuthStatus authStatus) => _authStatus.value = authStatus;

  @override
  void onInit() {
    _firebaseAuth = FirebaseAuth.instance;
    super.onInit();
  }

  Future verifyUser() async {
    log('${_authStatus.value} this is the value');
    log('${_firebaseAuth.currentUser} this is the user');
    if (_firebaseAuth.currentUser != null) {
      _appUser.value.uid = _firebaseAuth.currentUser?.uid;
      _appUser.value.email = _firebaseAuth.currentUser?.email;
    } else {
      _authStatus.value = AuthStatus.unauthenticated;
      log('${_authStatus.value} new status');
    }
  }
}