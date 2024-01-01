import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';
import 'package:todo_list/home%20layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RecipesCubit())
      ],
      child: BlocConsumer<RecipesCubit,RecipesState>(
        listener:(context,state){} ,
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,

                titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
              )
            ),
            home:const HomeLayout(),
          );
        } ,
      ),
    );
  }
}


