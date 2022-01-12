import 'package:flutter/material.dart';
import 'package:misam_edu_teacher/utils/consts.dart';

Container logoSection({required BuildContext context, required double height}) {
  return Container(
      height: height,
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
                      style: const TextStyle(
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
              const Text("Choose us, be ahead",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
        ],
      ));
}
