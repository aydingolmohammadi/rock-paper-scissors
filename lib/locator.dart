import 'package:get/get.dart';

import 'features/feature_home/presentation/controller/home_controller.dart';

Future<void> initDependencies() async {
  // home Controller
  Get.lazyPut(() => HomeController());
}