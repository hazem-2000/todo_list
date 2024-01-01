import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';
import 'package:todo_list/network/recipe_services.dart';
import 'package:todo_list/screen/detales%20screen.dart';

import '../network/recipe_model.dart';

class RecipesScreen extends StatelessWidget {

  List<APIHits > currentSearchList=[];
  APIRecipeQuery? _currentRecipes1;

  @override
  Widget build(BuildContext context) {
    var recipe = RecipesCubit.get(context).currentRecipes1 ;

    return BlocConsumer<RecipesCubit,RecipesState>(
      listener:(context,state) {},
      builder: (context,state){
        var searchController = TextEditingController();
        var cubit=RecipesCubit.get(context);
        var y=cubit.currentRecipes1;
        //var list = cubit.search;



        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller:searchController ,
                  keyboardType: TextInputType.text,

                  //onFieldSubmitted: ,
                  /*onChanged:(value){
                    cubit.getSearch(value);
                  } ,*/
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter one word at least';
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                      labelText: "Search",

                      suffixIcon: IconButton(onPressed: () {
                       // RecipeService.getData(url);
                        print('current ${cubit.currentRecipes1}');
                        cubit.getSearch(searchController.text,);
                        print('sssss${cubit.searchLabel}');
                        print('hazem${currentSearchList}');
                        }, icon: Icon(Icons.search),),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,

                ),
                Container(
                  height: 600,
                  width: 400,
                  child: //_buildRecipeLoader(context, searchController.text)

                  ConditionalBuilder(
                    condition: cubit.currentRecipes1 != null,
                    builder: (context) =>
                        productsBuilder(1,context),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  )
                ),




              ],
            ),
          ),
        );
      },

    );

  }







  Widget productsBuilder(index,context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [

        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 1.58,
          children: List.generate(
            RecipesCubit.get(context).currentRecipes1!.hits!.length,
                (index) => Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    onTap: (){


                         Navigator.push(context,MaterialPageRoute(builder: (context){
                           return DetailesScreen(
                               image: RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.image,
                               label: RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.label,
                               cal: RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.calories
                           );
                         }) );

                      print('click$index');
                    },
                    child: Image(
                      image: NetworkImage(
                         RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.image ),
                      height: 200,
                      width: double.infinity,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.label,


                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                        Text(RecipesCubit.get(context).currentRecipes1!.hits![index].recipe.calories.floor().toString()+' Kcal')

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );


}
