import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class AuthController extends GetxController {
  RxBool isSignedIn = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUserCreated = false.obs;
  RxBool isVerified = false.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final db = GetStorage();
  late Rx<UserCredential> user;
  // final AuthController homeController = Get.find<AuthController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Get.snackbar("Network Status", "No Internet Connection",
            backgroundColor: Colors.white, colorText: Colors.blueGrey);
      }
    });

    // isSignedIn.value = auth.currentUser != null;
    // if (!isSignedIn.value) {
    //   Get.offNamed("/login");
    // } else {
    //   if (!isUserCreated.value) {
    //     await isUserInfoCreated();
    //     if (!isVerified.value) {
    //       await isVerifedTeacher();
    //     }
    //   }
    // }
    everAll([isSignedIn, isVerified, isUserCreated], handleAuthStateChanged);

    auth.authStateChanges().listen((event) {
      isSignedIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();

    // TODO: implement onClose
    // Get.offAllNamed("/login");

    super.onClose();
  }

  Future login() async {
    isLoading.value = true;
    try {
      googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential? credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      await auth.signInWithCredential(credential!);

      if (!isUserCreated.value) {
        await isUserInfoCreated();
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error " + e.toString());
      showSnackbar(title: "Status", desc: "Error signing in");
    }
  }

  void logOut() async {
    // print("Logging out");

    await googleSignIn.signOut();
    await auth.signOut();
    await db.remove("isUserCreated");
    await db.remove("isVerified");

    isUserCreated.value = false;
    isVerified.value = false;
    showSnackbar(title: "Status", desc: "Logged Out");
  }

  void handleAuthStateChanged(isCreated) async {
    await db.write("isUserCreated", isUserCreated.value);
    // print("Helllooooo");
    print("isVerified " +
        isVerified.value.toString() +
        "isCreated " +
        isUserCreated.value.toString() +
        "isSignedIn " +
        isSignedIn.value.toString());
    if (!isSignedIn.value) {
      Get.offNamed("/login");
    } else {
      if (!isUserCreated.value) {
        await isUserInfoCreated();
      }
      if (isUserCreated.value && !isVerified.value) {
        await isVerifedTeacher();
      }
      if (isUserCreated.value && isVerified.value) {
        Get.offNamed("/teacherHome");
      }
      if (isUserCreated.value && !isVerified.value) {
        Get.offNamed("/teacherVerify");
      } else if (!isUserCreated.value) {
        Get.offAllNamed("/userInfo");
      }
    }
  }

  Future isVerifedTeacher() async {
    var data = await firestore
        .collection("teachers")
        .doc(auth.currentUser!.uid.toString())
        .get();
    if (data.exists) return data.data()!["isVerified"];
  }

  Future isUserInfoCreated() async {
    var data =
        await firestore.collection("teachers").doc(auth.currentUser!.uid).get();

    if (data.exists) {
      isUserCreated.value = true;

      isVerified.value = data.data()!["isVerified"];
      db.write("isVerified", isVerified.value);
    } else {
      isUserCreated.value = false;
    }
  }
}
