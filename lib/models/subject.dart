import 'package:flutter/material.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

class Subject {
  String name, imgUrl;
  Color color;
  Subject({required this.name, this.imgUrl = "", required this.color});
}

List<Subject> subjects = [
  Subject(name: "English", color: Colors.amber),
  Subject(name: "Maths", color: Colors.cyan),
  Subject(name: "Science", color: Colors.blueGrey),
  Subject(name: "Assamese", color: Colors.indigo),
  Subject(name: "Social Science", color: Colors.deepOrange),
  Subject(name: "History", color: Colors.deepPurple)
];
