import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData cyanTheme = ThemeData(
    primaryColor: Colors.cyan,
    primarySwatch: Colors.cyan,
    scaffoldBackgroundColor: Colors.cyan,
    colorScheme: ColorScheme.light(primary: Colors.cyan),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.cyan[800],
    ),
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
    useMaterial3: true,
  );
  final ThemeData pinkTheme = ThemeData(
    primaryColor: Colors.pink,
    primarySwatch: Colors.pink,
    scaffoldBackgroundColor: Colors.pink,
    colorScheme: ColorScheme.light(primary: Colors.pink),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.pink.shade300,
    ),
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
    useMaterial3: true,
  );

 // default value

  bool _isGreen = true;

  static  SharedPreferences? _sharedPref;
  void switchTheme(bool selected) {
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }
  bool get isGreen => _isGreen ;
  ThemeData get selectedThemeData => _isGreen?cyanTheme : pinkTheme;

  Future<void> createPrefObject()async{
    _sharedPref = await SharedPreferences.getInstance();
  }
  void saveThemeToSharedPref (bool value){
    _sharedPref?.setBool('themeData', value);
  }
  void loadThemeFromSharedPref(){
    _isGreen = _sharedPref?.getBool('themeData')??true;
    
  }

}
