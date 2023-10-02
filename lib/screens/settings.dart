
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/color_theme_db.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Seçimi Yapınız'),
      ),
      body: SwichCard(),
    );
  }

}
class SwichCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text greenText = Text('Blue', style: TextStyle(color: Colors.cyan),);
    Text pinkText = Text('Pink', style: TextStyle(color: Colors.pink.shade300),);
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        subtitle:_value?greenText:pinkText ,
        title: Text('Change Theme Color'),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context,listen: false).switchTheme(value);

      },
        
      ),
    );
  }
}

