import 'package:get/get.dart';
import 'package:misam_edu_teacher/controllers/teacher_controller.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TeacherController());
  }
}
