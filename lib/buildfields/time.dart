import 'package:flutter/material.dart';
class buildTimeField extends StatelessWidget {
  final Widget? mywidget;
  TimeOfDay? timeOfDay1;
  buildTimeField({Key? key,required this.mywidget,required this.timeOfDay1,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0,),
        Row(
          children: [
            Text(
              'Time of Day',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize:28.0 ),

            ),
            SizedBox(width: 160.0,),
            Container(child: mywidget,)
          ],
        ),
        TextFormField(
          enabled: false,

          decoration: InputDecoration(
// 8
              hintText:
              " ${timeOfDay1?.hour.toString().padLeft(2,'0')}:${timeOfDay1?.minute.toString().padLeft(2,'0')}"

          ),
        ),



        SizedBox(height: 20.0,),
      ],
    );;
  }
}
