import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo_list/cubit/state.dart';

import '../cubit/cubit.dart';

class buildColorField extends StatelessWidget {



  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit,RecipesState>(
      listener:(context,state){} ,
      builder:(context,state){
        return Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Color',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize:28.0 ),

                ),
                SizedBox(width: 240.0,),
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    RecipesCubit.get(context)
                                        .pickColor();
                                    print(
                                        '${RecipesCubit.get(context).pickerColor}');
                                    Navigator.pop(context);
                                  },
                                  child: Text('Pick')),
                            ],
                            title: Text('Pick a color'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: RecipesCubit.get(context)
                                    .pickerColor,
                                onColorChanged: (color) {
                                  RecipesCubit.get(context)
                                      .changeColor(color);
                                },
                              ),
                            ),
                          );
                        });
                  },
                  child: Text("select",style: TextStyle(fontWeight: FontWeight.bold),),
                ),

              ],
            ),


            SizedBox(height: 20.0,),

          ],
        );
      } ,

    );
  }
}

