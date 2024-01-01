import 'package:flutter/material.dart';
import 'package:todo_list/cubit/cubit.dart';

class BookMarksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget buildItem(index) {
      var y=RecipesCubit.get(context).book;

      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage
                      ("${y[index].image}"),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${y[index].label}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),


                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [

          Container(
            height: 700,
            width: 250,
            child:ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildItem(index),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: RecipesCubit.get(context).book.length),
          )
        ],
      ),
    );
  }
}
