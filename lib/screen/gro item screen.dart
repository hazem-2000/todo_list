import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';
import 'package:uuid/uuid.dart';

import '../buildfields/color.dart';
import '../buildfields/date.dart';
import '../buildfields/name.dart';
import '../buildfields/quantity.dart';
import '../buildfields/time.dart';
import '../model/item model.dart';


class GroceryItemScreen extends StatelessWidget {
  // 1
  final Function(GroceryItem) onCreate;
  // 2
  final Function(GroceryItem) onUpdate;
  // 3
  final GroceryItem? originalItem;
  // 4
  final bool isUpdating;
  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit,RecipesState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=RecipesCubit.get(context);


        @override
        void initState() {
          // 1

          if (originalItem != null) {
            cubit.nameController.text = originalItem!.name;
            cubit.name = originalItem!.name;
            cubit.currentSliderValue = originalItem!.quantity;
            cubit.importance = originalItem!.importance;
            cubit.currentColor = originalItem!.color;
            final date = originalItem!.date;
            cubit.timeOfDay = TimeOfDay(hour: date.hour, minute:
            date.minute);
            cubit.dueDate = date;
          }
// 2
          cubit.nameController.addListener(() {

            cubit.name = cubit.nameController.text;

          });


        }

        return Scaffold(
          // 2
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black,),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.check,color: Colors.black,),
                onPressed: () {
                  final groceryItem = GroceryItem(
                    id: originalItem?.id ?? const Uuid().v1(),
                    name: cubit.nameController.text,
                    importance: cubit.importance,
                    color: cubit.currentColor,
                    quantity: cubit.currentSliderValue,
                    date: DateTime(
                      cubit.dueDate.year,
                      cubit.dueDate.month,
                      cubit.dueDate.day,
                      cubit.timeOfDay.hour,
                      cubit.timeOfDay.minute,
                    ), );
                  if (isUpdating) {
                    // 2
                    onUpdate(groceryItem);
                  } else {
// 3
                    onCreate(groceryItem);
                  }
                },)
            ],
// 3
            elevation: 0.0,
            // 4
            title: Text(
              'Grocery Item',

              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,

          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                buildNameField(currentColor1: cubit.currentColor, nameController1: cubit.nameController, ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        RecipesCubit.get(context)
                            .sizeSelection(RecipesCubit.get(context).low);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: RecipesCubit.get(context).lowColor,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'low',
                            style:
                            TextStyle(fontSize: 15, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        RecipesCubit.get(context)
                            .sizeSelection(RecipesCubit.get(context).medium);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: RecipesCubit.get(context).mediumColor,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text('medium',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        RecipesCubit.get(context)
                            .sizeSelection(RecipesCubit.get(context).high);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: RecipesCubit.get(context).highColor,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text('high',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                buildDateField(taskDate: cubit.dueDate,
                    mywidget: GestureDetector(onTap: (){
                      cubit.getDate(context);
                    },
                      child: Text("select", style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                ),

                buildTimeField(mywidget:GestureDetector(onTap: (){
                  cubit.showTime(context);
                },
                  child: Text("select", style: TextStyle(fontWeight: FontWeight.bold),),
                ), timeOfDay1: cubit.timeOfDay ,),
                buildColorField(),
                QuantityField(),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 5,
                        color: RecipesCubit.get(context).currentColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cubit.nameController.text, style:  TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 18),),
                          Text(cubit.dueDate.year.toString()+"/"+cubit.dueDate.month.toString()+"/"+cubit.dueDate.day.toString()),
                          SizedBox(width: 10,),
                          Text(cubit.timeOfDay.hour.toString()+":"+cubit.timeOfDay.minute.toString())


                        ],
                      ),
                      Spacer(),
                      Text('${cubit.SliderValue}',style: TextStyle(fontSize: 20),),
                    ],

                  ),
                )

              ],
            ), ),
        );
      },

    );
  }
}



