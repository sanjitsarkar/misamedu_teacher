import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';
import 'package:misam_edu_teacher/pages/widgets/loader.dart';
import 'package:misam_edu_teacher/pages/widgets/logo_section.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class Login extends GetWidget<AuthController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        logoSection(context: context, height: h(context) / 2),
        Container(
            height: h(context) / 1.4,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // LoginForm(),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Column(
                      children: [
                        SizedBox(height: 50),
                        Center(
                          child: loader(),
                        ),
                      ],
                    );
                  }
                  return Container(
                    width: w(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () => {controller.login()},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Login in with Google",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Image(
                            image: AssetImage('assets/images/google.png'),
                            fit: BoxFit.cover,
                            height: 40,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 5,
                          side: BorderSide(width: 2, color: primaryColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10)),
                    ),
                  );
                }),
                // Spacer(),
                // BottomSection()
              ],
            )),
      ],
    )));
  }
}
