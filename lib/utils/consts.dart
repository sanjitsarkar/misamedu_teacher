import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misam_edu_teacher/utils/utils.dart';

// Color primaryColor = Utils.fromHex("#3482DD");
Color secondaryColor = Utils.fromHex("#FFF500");
Color primaryColor = Colors.cyan;
// Color secondaryColor = Colors.yellowAccent;
double w(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double h(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void showSnackbar({required String title, required String desc}) {
  Get.snackbar(title, desc,
      backgroundColor: Colors.white, colorText: Colors.blueGrey);
}

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
// FirebaseStorage storage = FirebaseStorage.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
