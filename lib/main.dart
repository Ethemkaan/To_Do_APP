
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/color_theme_db.dart';
import 'package:to_do_app/models/items_db.dart';
import './screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemDb().createPrefObject();
  runApp(MultiProvider(providers: [
  ChangeNotifierProvider<ItemDb>(create: (BuildContext context )=> ItemDb()),
    ChangeNotifierProvider<ColorThemeData>(create: (context)=> ColorThemeData())
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    Provider.of<ItemDb>(context).loadItemsFromSharedPref();
    return MaterialApp(
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: HomePage(),
    );
  }
}

