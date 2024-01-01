import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/state.dart';

import 'cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = RecipesCubit.get(context);
    return  BlocConsumer<RecipesCubit,RecipesState>(
      listener:(context,state){} ,
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('Recipes'),
          ),
          body:cubit.bottomsScreen[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(

            unselectedItemColor: Colors.grey,
            fixedColor: Colors.green,
            backgroundColor: Colors.white,
            onTap: (index) {
              cubit.changeBottom(index);




            },

            currentIndex: cubit.currentIndex,

            items:  [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_rounded),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note_add),
                label: 'Groceries',
              ),


            ],
          ),
        );
      },
    );
  }
}
