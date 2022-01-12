import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';
import 'package:misam_edu_teacher/controllers/teacher_controller.dart';
import 'package:misam_edu_teacher/models/standard.dart';
import 'package:misam_edu_teacher/models/subj.dart';
import 'package:misam_edu_teacher/pages/widgets/loader.dart';
import 'package:misam_edu_teacher/utils/consts.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class UserInfoPage extends GetWidget<AuthController> {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
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
                UserInfoForm(authController: controller),
              ],
            )),
      ],
    )));
  }
}

class UserInfoForm extends GetWidget<TeacherController> {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController;

  UserInfoForm({required this.authController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          // height: h(context) / 1.48,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        initialValue: controller.fullName.value,
                        decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.black45),
                          hintText: 'Enter Full Name',
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                        onChanged: (value) => {
                              controller.fullName.value = value,
                            })),
                SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    initialValue: controller.phoneNumber.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length != 10) {
                        return 'Phone number must be at least 10 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    // maxLength: 10,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 17, color: Colors.black45),
                      hintText: 'Enter Phone Number',
                      prefixIcon: Icon(Icons.call),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                    onChanged: (value) => {
                      controller.phoneNumber.value = value,
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your communiction address';
                          }
                          return null;
                        },
                        initialValue: controller.communicationAddress.value,
                        decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.black45),
                          hintText: 'Enter Communication Adress',
                          labelText: 'Enter Communication Adress',
                          prefixIcon: Icon(Icons.home_work_outlined),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                        onChanged: (value) => {
                              controller.communicationAddress.value = value,
                            })),
                const SizedBox(height: 10),

                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your communiction address';
                          }
                          return null;
                        },
                        maxLines: 3,
                        initialValue: controller.communicationAddress.value,
                        decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.black45),
                          hintText: 'Enter Home Adress',
                          labelText: 'Enter Home Adress',
                          prefixIcon: Icon(Icons.home),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                        onChanged: (value) => {
                              controller.homeAddress.value = value,
                            })),
                const SizedBox(height: 10),
                Container(
                    width: w(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            primary: Colors.white,
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                        child: Text("Select Classes you will teach",
                            style: TextStyle(color: Colors.blueGrey)),
                        onPressed: () =>
                            {_selectSubjects(context, controller)})),
                const SizedBox(height: 10),
                Container(
                    width: w(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            primary: Colors.white,
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                        child: Text(
                          "Select Classes you will teach",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onPressed: () =>
                            {_selectClasses(context, controller)})),
                // if (widget.userType == "teacher" &&
                //     controller.classes.length != 0)
                //   const SizedBox(height: 10),
                // if (widget.userType == "teacher" &&
                //     controller.classes.length != 0)
                //   SizedBox(
                //     height: 200,
                //     child: GridView.builder(
                //       itemCount: controller.classes.length,
                //       itemBuilder: (context, i) => ListTile(
                //         title: Text(controller.classes[i].toString()),
                //       ),
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2),
                //     ),
                //   ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Select Your Degree",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: w(context),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String>(
                      value: controller.degree.value,

                      isExpanded: false,
                      //elevation: 5,

                      style: TextStyle(color: Colors.black),

                      items: <String>[
                        "BA",
                        "BSc",
                        "BCom",
                        "MA",
                        "MSc",
                        "MCom",
                        "Other"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(value),
                          ),
                        );
                      }).toList(),

                      hint: const Text(
                        "Please choose Highest Degree",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),

                      onChanged: (value) {
                        controller.degree.value = value!;
                      },
                    )),

                SizedBox(height: 20),
                if (controller.isLoading.value)
                  Center(
                    child: loader(),
                  )
                else
                  Container(
                    width: w(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final FocusNode? focusScopeNode =
                              FocusScope.of(context).focusedChild;
                          focusScopeNode!.unfocus();
                          await controller.saveInfo();
                        }
                      },
                      child: const Text("Submit"),
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                    ),
                  ),
                SizedBox(height: 10),
                Container(
                  width: w(context),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      authController.logOut();
                    },
                    child: Text("Login with another account"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

void _selectClasses(BuildContext context, TeacherController controller) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      return MultiSelectDialog(
        items: <Standard?>[
          Standard("3", "1"),
          Standard("4", ""),
          Standard("5", ""),
          Standard("6", ""),
          Standard("7", ""),
          Standard("8", ""),
          Standard("9", ""),
          Standard("10", ""),
          Standard("11 Arts", ""),
          Standard("11 Science", ""),
          Standard("11 Commerce", ""),
          Standard("12 Arts", ""),
          Standard("12 Science", ""),
          Standard("12 Commerce", ""),
        ].map<MultiSelectItem<Standard?>>((Standard? value) {
          return MultiSelectItem<Standard?>(value, value!.name);
        }).toList(),
        initialValue: controller.classes,
        onConfirm: (List<Standard?> values) {
          controller.classes.value = values;
        },
      );
    },
  );
}

void _selectSubjects(BuildContext context, TeacherController controller) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      return MultiSelectDialog(
        items: <Subj?>[
          Subj("English", ""),
          Subj("Maths", ""),
          Subj("Science", ""),
          Subj("Social Science", ""),
          Subj("Political Science", ""),
          Subj("History", ""),
          Subj("Geography", ""),
          Subj("Economics", ""),
          Subj("Hindi", ""),
          Subj("Assamese", ""),
          Subj("Physics", ""),
          Subj("Biology", ""),
          Subj("Chemistry", ""),
          Subj("Bussieness Studies", ""),
          Subj("Accountancy", ""),
        ].map<MultiSelectItem<Subj?>>((Subj? value) {
          return MultiSelectItem<Subj?>(value, value!.name);
        }).toList(),
        initialValue: controller.subjects,
        onConfirm: (List<Subj?> values) {
          controller.subjects.value = values;
        },
      );
    },
  );
}
