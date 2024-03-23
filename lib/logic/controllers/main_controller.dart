import 'package:get/get.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/view/screens/layout/category_screen.dart';
import 'package:shoply/view/screens/layout/favorites_screen.dart';
import 'package:shoply/view/screens/layout/home_screen.dart';
import 'package:shoply/view/screens/layout/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  var title = [
    AppStrings.asrooShop,
    AppStrings.categories,
    AppStrings.favourites,
    AppStrings.settings,
  ].obs;
}
