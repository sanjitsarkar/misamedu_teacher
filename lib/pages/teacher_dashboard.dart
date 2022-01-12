import 'package:flutter/material.dart';
import 'package:misam_edu_teacher/models/subject.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: RichText(
                text: TextSpan(
                    text: "Hey there,\n",
                    style: TextStyle(
                        fontSize: 26, color: Colors.white.withOpacity(.9)),
                    children: [
                  TextSpan(
                      text: auth.currentUser!.displayName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ))
                ])),
          ),
        ]));
  }
}
