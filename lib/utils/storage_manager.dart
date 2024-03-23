import 'package:get_storage/get_storage.dart';

const String isDarkMode = "isDarkMode";
const String isAuthenticated = "isAuthenticated";
const String isFavouritesList = "isFavouritesList";

class AppStorage {
  final GetStorage _boxStorage;

  AppStorage(this._boxStorage);

  void setThemeDataInBox(bool darkMode) {
    _boxStorage.write(isDarkMode, darkMode);
  }

  bool getThemeDataFromBox() {
    return _boxStorage.read<bool>(isDarkMode) ?? false;
  }

  void setUserInBox(bool authenticated) async {
    _boxStorage.write(isAuthenticated, authenticated);
  }

  bool getUserFromBox() {
    return _boxStorage.read<bool>(isAuthenticated) ?? false;
  }

  void removeUserFromBox() {
    _boxStorage.remove(isAuthenticated);
  }

  void setFavoritesInBox(List favouritesList) {
    _boxStorage.write(isFavouritesList, favouritesList);
  }

  List getFavoritesFromBox() {
    return _boxStorage.read<List>(isFavouritesList) ?? [];
  }

  void removeFavoritesFromBox() {
    _boxStorage.remove(isFavouritesList);
  }
}
