import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_db.dart';
import 'package:to_do_app/screens/settings.dart';
import 'package:to_do_app/widgets/item_card.dart';

import 'item_add.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
            },
                icon:Icon(Icons.settings)),
          )
        ],
        title: Text(
          'Get It Done',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                '${Provider.of<ItemDb>(context).items.length} Items ',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Consumer<ItemDb>(builder: (context,itemDb,child)=>Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                      itemBuilder: (context, index) => ItemCard(
                        title: itemDb.items[index].title,
                        isDone: itemDb.items[index].isDone,
                        toggleStatus: (_ ) {
                          itemDb.toggleStatus(index);
                        },
                        deleteItem: (_) {
                          itemDb.deleteItem(index);
                        },
                      ),
                      itemCount: Provider.of<ItemDb>(context).items.length),
                ),),
              ),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context,
              builder: (context) =>  ItemAdd(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          ));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

