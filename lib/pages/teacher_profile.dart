import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';
import 'package:misam_edu_teacher/controllers/teacher_controller.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TeacherController teacherController = Get.find<TeacherController>();
    final AuthController authController = Get.find<AuthController>();

    return Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              height: h(context) / 4,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      auth.currentUser!.photoURL!,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(teacherController.teacherInfo.value.fullName,
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 5),
                  Text(teacherController.teacherInfo.value.degree,
                      style: TextStyle(color: secondaryColor, fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black.withOpacity(.25))
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account Details",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 20)),
                        Divider(),
                        customItem(
                            icon: Icon(Icons.phone),
                            title:
                                teacherController.teacherInfo.value.phoneNumber,
                            onPressed: () => {})
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.25))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Profile Details",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                            Divider(),
                            customItem(
                                icon: Icon(Icons.person),
                                title: auth.currentUser!.displayName!,
                                onPressed: () => {}),
                            customItem(
                                icon: Icon(Icons.email),
                                title: auth.currentUser!.email!,
                                onPressed: () => {}),
                            customItem(
                                icon: Icon(Icons.location_city),
                                title: teacherController
                                    .teacherInfo.value.homeAddress,
                                onPressed: () => {}),
                            customItem(
                                icon: Icon(Icons.location_city),
                                title: teacherController
                                    .teacherInfo.value.communicationAddress,
                                onPressed: () => {}),
                            customItem(
                                icon: Icon(Icons.book),
                                title: teacherController
                                    .teacherInfo.value.subjects
                                    .toString(),
                                onPressed: () => {}),
                            customItem(
                                icon: Icon(Icons.class__outlined),
                                title: teacherController
                                    .teacherInfo.value.classes
                                    .toString(),
                                onPressed: () => {}),
                            SizedBox(
                              width: w(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  authController.logOut();
                                },
                                child: Text("Logout"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10)),
                              ),
                            ),
                          ]))
                ],
              ),
            )
          ],
        ));
  }

  Row customItem(
      {required Icon icon,
      required String title,
      required VoidCallback onPressed}) {
    return Row(
      children: [
        icon,
        SizedBox(width: 10),
        Text(title),
        Spacer(),
        IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.edit, color: Colors.black38)),
        SizedBox(height: 10),
      ],
    );
  }
}
