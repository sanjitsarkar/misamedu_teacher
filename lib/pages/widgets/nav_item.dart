import 'package:flutter/material.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

ListTile navItem(
    {required Icon icon,
    required String title,
    required VoidCallback onTap,
    int? badgeValue}) {
  return ListTile(
    onTap: onTap,
    selectedTileColor: primaryColor.withOpacity(.2),
    title: Text(
      title,
    ),
    leading: icon,
    trailing: badgeValue != null
        ? const CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text("3", style: TextStyle(color: Colors.white)))
        : null,
  );
}
