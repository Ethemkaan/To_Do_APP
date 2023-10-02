import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_db.dart';

class ItemAdd extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: textController,
                    onChanged: (input) {
                      print(input);

                    },
                    style: TextStyle(color: Colors.black,fontSize: 20),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add Item',
                        hintText: '...'),
                    autofocus: true,
                  ),
                  ElevatedButton(onPressed: () {
                    Provider.of<ItemDb>(context,listen: false).addItem(textController.text);
                    Navigator.pop(context);

                  }, child: Text('ADD',style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor

                    ),)
                ],
              ),
            )
        ),
      );
  }
}



