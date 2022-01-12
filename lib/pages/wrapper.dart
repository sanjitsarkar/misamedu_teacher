import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';
import 'package:misam_edu_teacher/pages/widgets/loader.dart';
import 'package:misam_edu_teacher/pages/widgets/logo_section.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class Wrapper extends GetWidget<AuthController> {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("nn " + auth.currentUser!.uid.toString());
    // if (auth.currentUser == null) {
    //   // Get.toNamed("/login");

    // }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            logoSection(context: context, height: h(context) / 2),
            SizedBox(height: h(context) / 5),
            Center(
              child: loader(),
            ),
          ],
        ),
      ),
    );
  }
}
