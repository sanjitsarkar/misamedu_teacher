import 'package:get/get.dart';
import 'package:misam_edu_teacher/controllers/tution_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TutionController());
  }
}
