import 'package:get/get.dart';
import 'package:prep_iq/features/ressults/controller/ressult_controller.dart';


class ResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultsController>(() => ResultsController());
  }
}