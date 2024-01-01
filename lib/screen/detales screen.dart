import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';

import '../network/recipe_model.dart';

class DetailesScreen extends StatelessWidget {
  final image;
  final label;
  final double cal;

  const DetailesScreen({ required this.image, required this.label, required this.cal});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit,RecipesState>(
      listener:(context,state){} ,
      builder: (context,state){
        var item1=image;
        var item2=label;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: NetworkImage(image),
                  height: 400,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        //maxLines: 2,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey.shade300,
                        ),
                        padding: EdgeInsets.all(5),


                          child: Text('${cal.floor().toString()+' Kcal'}'))

                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Spacer(),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 25,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    minWidth: 150,
                    onPressed: () {
                      RecipesCubit.get(context).AddToBookMarkImage(image);
                      RecipesCubit.get(context).AddToBookMarkLabel(label);
                      RecipesCubit.get(context).AddToBook(APIRecipe(image: item1,label: item2,calories: cal));
                      print('label is ${RecipesCubit.get(context).labelList}');
                      Navigator.pop(context);
                    },
                    color: Colors.green,
                    height: 50,
                    child: Text(
                      'bookmark'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                /*SizedBox(
                                  width: 40,
                                ),*/




              ],
            ),
          ),
        );
      },

    );
  }
}
