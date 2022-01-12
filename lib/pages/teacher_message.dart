import 'package:flutter/material.dart';

class TeacherMessage extends StatelessWidget {
  const TeacherMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "No Message Available",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
