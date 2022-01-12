import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misam_edu_teacher/models/standard.dart';
import 'package:misam_edu_teacher/models/subj.dart';
import 'package:misam_edu_teacher/models/teacher.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class TeacherController extends GetxController {
  Rx<Teacher> teacherInfo = Teacher(
          fullName: "",
          homeAddress: "",
          communicationAddress: "",
          classes: [],
          subjects: [],
          degree: "",
          phoneNumber: "")
      .obs;
  Rx<String?> fullName = auth.currentUser!.displayName.obs;
  RxBool isLoading = false.obs;
  RxString phoneNumber = "".obs;

  RxString communicationAddress = "".obs;
  RxString homeAddress = "".obs;
  RxString degree = "BA".obs;
  RxList<Subj?> subjects = [Subj("", "")].obs;
  RxString verificationCode = "".obs;
  RxList<Standard?> classes = [Standard("", "")].obs;

  late RxBool isTeacherInfoCreated;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    await getTeacherInfo();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // Get.offAllNamed("/login");
    super.onClose();
  }

  // void getStudentInfo() async {
  //   var data = await firestore.collection("students").get();
  //   if (data.docs.isEmpty) {
  //     isStudentInfoCreated.value = false;
  //   } else {
  //     isStudentInfoCreated.value = true;
  //   }
  // }

  Future saveInfo() async {
    try {
      isLoading.value = true;
      fullName.value = auth.currentUser!.displayName;
      dynamic data = {
        "fullName": fullName.value,
        "phoneNumber": phoneNumber.value,
        "email":auth.currentUser!.email,
        "isVerified": false,
        "classes": classes.map((element) => element!.name).toList(),
        "subjects": subjects.map((element) => element!.name).toList(),
        "degree": degree.value,
        "communicationAddress": communicationAddress.value,
        "homeAddress": homeAddress.value,
        "createdAt": FieldValue.serverTimestamp(),
        "updatedAt": FieldValue.serverTimestamp(),
        "tuitions": 0,
      };
      print(auth.currentUser!.uid);
      // var data =
      await firestore
          .collection("teachers")
          .doc(auth.currentUser!.uid.toString())
          .set(data);
      isLoading.value = false;
      // fullName.value = "";
      phoneNumber.value = "";
      homeAddress.value = "";
      communicationAddress.value = "";
      degree.value = "BSc";

      showSnackbar(title: "Status", desc: "Added User Info");

      Get.offAllNamed("/teacherVerify");
    } catch (e) {
      showSnackbar(title: "Status", desc: "Error adding User Info");
    }
  }

  Future isVerifedTeacher() async {
    var data = await firestore
        .collection("teachers")
        .doc(auth.currentUser!.uid.toString())
        .get();
    return data.data()!["isVerified"];
  }

  // Future checkVerificationCode(String verificationCode) async {
  //   isLoading.value = true;
  //   var data = await firestore
  //       .collection("verificationCodes")
  //       .doc(auth.currentUser!.uid)
  //       .get();

  //   isLoading.value = false;

  //   if (data.exists) {
  //     if (data.data()!["code"] == verificationCode) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  Future getTeacherInfo() async {
    var data = await firestore
        .collection("teachers")
        .doc(auth.currentUser!.uid.toString())
        .get();
    if (data.exists) teacherInfo.value = Teacher.fromMap(data.data()!);
  }

  // Future updateInfo(String verificationCode) async {
  //   await firestore
  //       .collection("teachers")
  //       .doc(auth.currentUser!.uid.toString())
  //       .update({
  //     "isVerified": true,
  //     "updatedAt": FieldValue.serverTimestamp(),
  //   });

  //   await firestore
  //       .collection("stats")
  //       .doc("stat")
  //       .update({"totTeachers": FieldValue.increment(1)});
  // }
}
