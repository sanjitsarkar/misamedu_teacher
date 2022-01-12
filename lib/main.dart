import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:misam_edu_teacher/bindings/auth_binding.dart';
import 'package:misam_edu_teacher/bindings/teacher_binding.dart';
import 'package:misam_edu_teacher/pages/login.dart';
import 'package:misam_edu_teacher/pages/teacher_home.dart';
import 'package:misam_edu_teacher/pages/teacher_verify_page.dart';
import 'package:misam_edu_teacher/pages/user_info_page.dart';
import 'package:misam_edu_teacher/pages/wrapper.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

// import 'package:get_storage/get_storage.dart';
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding?.ensureInitialized();
  await Firebase?.initializeApp();
  initialize();
  runApp(const MyApp());
}

void initialize() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // onInit: () async {
      //   WidgetsFlutterBinding?.ensureInitialized();
      //   await Firebase?.initializeApp();
      // },
      initialBinding: AuthBinding(),

      theme: ThemeData(
          primaryColor: primaryColor, secondaryHeaderColor: secondaryColor),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Wrapper()),
        GetPage(
            name: '/teacherVerify',
            page: () => TeacherVerifyPage(),
            binding: TeacherBinding()),
        GetPage(
            name: '/teacherHome',
            page: () => TeacherHome(),
            binding: TeacherBinding()),
        GetPage(
          name: '/login',
          page: () => Login(),
        ),
        GetPage(
            name: '/userInfo',
            page: () => UserInfoPage(),
            bindings: [TeacherBinding()]),
      ],
    );
  }
}
