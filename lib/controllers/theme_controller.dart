import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:re_pr2_harikrushna_2121/modal/product_modal.dart';

class ThemeController extends GetxController {
  ThemeModel models = ThemeModel();

  changeTheme() {
    models.theme.value = !models.theme.value;
  }
}
