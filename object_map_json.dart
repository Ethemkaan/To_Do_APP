import 'dart:convert';

main(){
  Item itemObject = Item(title: 'uyu' , isDone: true);

  Map itemAsMap = itemObject.toMap();
  String itemAsJson = json.encode(itemAsMap);
  itemAsMap = json.decode(itemAsJson);
  itemObject = Item.fromMap(itemAsMap);
}

class  Item {
  String? title;
  bool? isDone;
   Item({this.title,this.isDone});
   Item.fromMap(Map map ): title= map['title'],isDone=map['isDone'];
   Map<String,dynamic> toMap()=> {'title': title , 'isDone': isDone};
 }