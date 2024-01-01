import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class buildDateField extends StatelessWidget {
  DateTime taskDate;
  final Widget? mywidget;
  buildDateField({Key? key,required this.taskDate,required this.mywidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize:28.0 ),

            ),
            SizedBox(width: 250.0,),
            Container(child: mywidget,
            ),


          ],
        ),


        TextFormField(
            enabled: false,
            decoration: InputDecoration(
              hintText:
              DateFormat.yMd().format(taskDate),

            )
        ),
      ],
    );;
  }
}
