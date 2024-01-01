import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/item model.dart';

class GroceryTile extends StatelessWidget {
  // 1
  final GroceryItem item;
  // 2
  final Function(bool?)? onComplete;
  // 3
  final TextDecoration textDecoration;
// 4
  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete,
  }) : textDecoration =
  item.isComplete ? TextDecoration.lineThrough :
  TextDecoration.none,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style:  TextStyle(decoration: item.isComplete ?
                TextDecoration.lineThrough:TextDecoration.none,
                    fontWeight: FontWeight.bold,fontSize: 18),

              ),


              buildCheckbox(),

              // TODO 22: Add Row to group (name, date, importance)
              // TODO 23: Add Row to group (quantity, checkbox)
            ],
          ),
          Row(
            children: [
              Text(item.date.year.toString()+"/"+item.date.month.toString()+"/"+item.date.day.toString()),
              SizedBox(width: 10,),
              Text(item.date.hour.toString()+":"+item.date.minute.toString())],
          ),

        ],
      ),
    ); }
// TODO: Add BuildImportance()
// TODO: Add buildDate()
  Widget buildCheckbox() {
    return Checkbox(
// 1
      value: item.isComplete,
// 2
      onChanged: onComplete,
    );
  }
}