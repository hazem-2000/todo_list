
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';

import 'empty screen.dart';
import 'gro item screen.dart';
import 'grocery list screen.dart';


class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 6
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add,),
        onPressed: () {
          final manager = RecipesCubit.get(context);
          Navigator.push(
            context,

            MaterialPageRoute(

              builder: (context) => GroceryItemScreen(

                onCreate: (item) {

                  manager.addItem(item);

                  Navigator.pop(context);
                },

                onUpdate: (item) {},
              ),
            ), );
        }, ),

      body: buildGroceryScreen(RecipesCubit.get(context)),
    );
  }

  Widget buildGroceryScreen( manager) {
// 1
    return BlocConsumer<RecipesCubit,RecipesState>(

      // 2
      listener: (context,state){},
      builder: (context,state) {
// 3
        if (manager.groceryItems.isNotEmpty) {
          return GroceryListScreen(manager: manager);
        } else { // 4
          return const EmptyGroceryScreen();
        }
      }, );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';
import 'package:todo_list/screen/item%20screen.dart';

class GroceriseScreen extends StatelessWidget {
  const GroceriseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget buildItem(index) {
          var ii = RecipesCubit.get(context).item;

          return Container(
            height: 100,
            width: 600,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 5,
                  color: ii[index].color,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('${ii[index].name}'),
                        Text('${ii[index].date}'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('${ii[index].time}'),
                      ],
                    ),
                    Text('${ii[index].importance}'),
                  ],
                ),
                Spacer(),
                Text(
                  '${ii[index].quantity}',
                  style: TextStyle(fontSize: 20),
                ),
                Checkbox(
                    activeColor: Colors.green,
                    value: RecipesCubit.get(context).checkBox,
                    onChanged: (value) {
                      ii[index].isComplete;
                    })
              ],
            ),
          );
        }

        return Scaffold(
          body: (RecipesCubit.get(context).item.length == 0)
              ? Center(
                  child: Text(
                  'No Groceries',
                  style: TextStyle(fontSize: 30),
                ))
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildItem(index),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: RecipesCubit.get(context).item.length),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ItemScreen();
              }));
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
*/
