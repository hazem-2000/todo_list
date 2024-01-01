import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/cubit.dart';
import 'package:todo_list/cubit/state.dart';
class QuantityField extends StatelessWidget {




  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit,RecipesState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=RecipesCubit.get(context);
        return Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize:28.0 ),
            ),


            Slider( value: cubit.SliderValue,min: 0,max:10,divisions: 10,
                label:(cubit.SliderValue).toString(),activeColor: Colors.green,
                thumbColor: Colors.green,onChanged: (value){
                    cubit.changeSlider(value);

                }),

          ],
        );
      },

    );;
  }
}
