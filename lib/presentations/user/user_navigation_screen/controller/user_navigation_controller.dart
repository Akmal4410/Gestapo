import 'package:get/get.dart';

class UserNavigationController extends GetxController {
  RxInt page = 0.obs;

  onPageChanged(int newPage) => page(newPage);
}
