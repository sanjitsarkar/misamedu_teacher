import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misam_edu_teacher/controllers/auth_controller.dart';

import 'package:misam_edu_teacher/pages/teacher_dashboard.dart';
import 'package:misam_edu_teacher/pages/teacher_message.dart';
import 'package:misam_edu_teacher/pages/teacher_profile.dart';
import 'package:misam_edu_teacher/utils/consts.dart';
import 'package:misam_edu_teacher/widgets/CustomAnimatedBottomBar.dart';

import 'widgets/nav_item.dart';

class TeacherHome extends StatefulWidget {
  TeacherHome({Key? key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

// var Subjects = [{"name":"English","imgUrl":""}]
class _TeacherHomeState extends State<TeacherHome> {
  int _currentIndex = 1;

  final _inactiveColor = Colors.grey;
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: getBody(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                    onDetailsPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                      Navigator.pop(context);
                    },
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(auth.currentUser!.photoURL!),
                    ),
                    accountName: Text(
                      auth.currentUser!.displayName!,
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: Text(auth.currentUser!.email!,
                        style: TextStyle(color: Colors.white)))),
            navItem(
                title: "My Tutions", icon: Icon(Icons.book), onTap: () => {}),
            navItem(
                title: "Messages",
                icon: Icon(Icons.message),
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  Navigator.pop(context);
                }),
            navItem(
                title: "Notifications",
                icon: Icon(Icons.notifications),
                onTap: () => {}),
            navItem(
                title: "Logout",
                icon: Icon(Icons.exit_to_app),
                onTap: () => {_authController.logOut()}),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 100,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.chat),
          title: Text('Message'),
          activeColor: Colors.indigo,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.blueGrey,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text(
            'Profile ',
          ),
          activeColor: Colors.deepOrange,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      TeacherMessage(),
      TeacherDashboard(context: context),
      TeacherProfile()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 100,
      toolbarHeight: 60,
      backgroundColor: primaryColor,
      leading: Container(
        margin: EdgeInsets.only(top: 10),
        child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.menu,
                color: primaryColor,
              ),
            )),
      ),
      actions: [
        IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 35,
            )),
        SizedBox(
          width: 20,
        )
      ],
      elevation: 0,
    );
  }
}
