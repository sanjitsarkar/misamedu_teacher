import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';
import 'package:misam_edu_teacher/controllers/teacher_controller.dart';
import 'package:misam_edu_teacher/pages/widgets/loader.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class TeacherVerifyPage extends GetWidget<AuthController> {
  const TeacherVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeacherController teacherController = Get.find<TeacherController>();
    return Scaffold(
        body: SafeArea(
            child: ListView(children: [
      Container(
          height: h(context) / 6,
          width: w(context),
          decoration: BoxDecoration(color: primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Misam",
                          style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                        TextSpan(
                            text: "Edu",
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 46,
                              fontWeight: FontWeight.bold,
                            ))
                      ])),
                  Text("Choose us, be ahead",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            ],
          )),
      Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                  // height: h(context) / 1.48,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //     margin: const EdgeInsets.symmetric(horizontal: 20),
                  //     decoration: BoxDecoration(
                  //       color: primaryColor.withOpacity(.2),
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     child:
                  // TextFormField(
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter verification code';
                  //           }
                  //           return null;
                  //         },
                  //         initialValue:
                  //             teacherController.verificationCode.value,
                  //         decoration: const InputDecoration(
                  //           hintStyle:
                  //               TextStyle(fontSize: 17, color: Colors.black45),
                  //           hintText: 'Enter Verification Code',
                  //           labelText: 'Enter Verification Code',
                  //           prefixIcon: Icon(Icons.verified),
                  //           border: InputBorder.none,
                  //           contentPadding: EdgeInsets.all(15),
                  //         ),
                  //         onChanged: (value) => {
                  //               teacherController.verificationCode.value =
                  //                   value,
                  //             })),
                  // SizedBox(height: 20),
                  // Container(
                  //   width: w(context),
                  //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       final FocusNode? focusScopeNode =
                  //           FocusScope.of(context).focusedChild;
                  //       focusScopeNode!.unfocus();
                  //       // If the form is valid, display a snackbar. In the real world,
                  //       // you'd often call a server or save the information in a database.
                  //       var isValid =
                  //           await teacherController.checkVerificationCode(
                  //               teacherController.verificationCode.value);
                  //       // var isVerified = await teacherController.isVerifedTeacher();
                  //       if (isValid) {
                  //         await teacherController.updateInfo(
                  //             teacherController.verificationCode.value);
                  //         Get.snackbar("Status", "Successfully Verified");
                  //         Get.offNamed("/teacherHome");
                  //       } else {
                  //         Get.snackbar("Status", "Invalid Verification Code");
                  //       }
                  //     },
                  //     child: teacherController.isLoading.value
                  //         ? loader()
                  //         : Text("Submit"),
                  //     style: ElevatedButton.styleFrom(
                  //         primary: primaryColor,
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 40, vertical: 15)),
                  //   ),
                  // ),
                  Center(
                    child: Text("Verification is under progress",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: w(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logOut();
                      },
                      child: Text("Login with another account"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                    ),
                  ),
                ],
              )),
            ],
          ))
    ])));
  }
}
