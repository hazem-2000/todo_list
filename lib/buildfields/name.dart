import 'package:flutter/material.dart';
class buildNameField extends StatelessWidget {
  final  TextEditingController nameController1 ;
  Color currentColor1;
  buildNameField({Key? key,
    required this.nameController1,
    required this.currentColor1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      // 2
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
// 3
        Text(
          'Item Name',
          style: TextStyle(fontWeight: FontWeight.w400,fontSize:28.0 ),
        ),
// 4
        TextField(
// 5
          controller: nameController1,
// 6
          cursorColor: currentColor1,
// 7
          decoration: InputDecoration(
// 8
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            // 9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: currentColor1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: currentColor1),
            ),
          ), ),
      ], );;
  }
}
