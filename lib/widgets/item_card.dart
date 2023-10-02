import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final void Function(bool?)? toggleStatus;
  final  deleteItem;
  ItemCard({required this.isDone, required this.title, required this.toggleStatus,required this.deleteItem});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: Key(title),
      child: Card(
        color: isDone? Theme.of(context).primaryColor: Colors.white,
        elevation:isDone?1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(title),
          trailing:
              Checkbox(value: isDone, activeColor: Colors.black, onChanged: toggleStatus),
        ),
      ),
    );
  }
}
