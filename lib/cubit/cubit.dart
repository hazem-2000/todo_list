import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/state.dart';
import 'package:todo_list/model/item%20model.dart';
import 'package:todo_list/network/recipe_services.dart';
import 'package:todo_list/screen/Book%20marks.dart';
import 'package:todo_list/screen/Groceries.dart';
import 'package:todo_list/screen/Recipes%20screen.dart';

import '../network/recipe_model.dart';
enum Size{
  Low,
  Medume,
  High
}

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesInitialState());

  static RecipesCubit get(context) => BlocProvider.of(context);
  APIRecipeQuery? apiRecipeQuery;
  //List<Item> item=[];
  String name = '';
  final nameController = TextEditingController();

  Importance importance = Importance.low;
  DateTime dueDate = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  Color currentColor = Colors.green;
  double currentSliderValue = 0;
  String date='';
  String time='';
  Size high=Size.High;
  Size medium=Size.Medume;
  Size low=Size.Low;
  String size='';
  Map<dynamic,dynamic>search1={};
  int currentIndex = 0;
  Color highColor=Colors.grey.shade300;
  Color mediumColor=Colors.grey.shade300;
  Color lowColor=Colors.grey.shade300;
  List? searchLabel ;
  APIRecipeQuery? currentRecipes1; //jso
  List<APIRecipe>book=[];// n example
  List<APIHits> currentSearchList = [];
  List<Widget> bottomsScreen = [
    RecipesScreen(),
    BookMarksScreen(),
    GroceryScreen()
  ];


  final _groceryItems = <GroceryItem>[];

  List<GroceryItem> get groceryItems =>
      List.unmodifiable(_groceryItems);

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    emit(DeleteState());

  }

  AddToBook(APIRecipe item){
    book.add(item);
  }

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    emit(AddState());

  }

  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    emit(UpdateState());

  }

  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    emit(IsCompleteState());

  }

 /* void addItem(Item x) {
    item.add(x);
    emit(AddState());

  }*/

  /*void updateItem(Item x, int index) {
    item[index] = x;
    emit(UpdateState());
  }*/

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }

 /* void deleteItem(int index) {
    item.removeAt(index);
    emit(DeleteState());
  }*/


  /*void completeItem(int index, bool change) {
    final i = item[index];
    item[index] =(i.isComplete=change) as Item;
    emit(IsCompleteState());

  }*/

  Color pickerColor=Colors.green;
  /*Color currentColor=Colors.green;*/

  void pickColor(){
    currentColor=pickerColor;
    emit(ChoiceColorState());
  }

  void changeColor(Color color) {

     pickerColor = color;
     emit(ChangeColorState());
  }

  Future loadRecipes() async {
    final jsonString = await rootBundle.loadString('assets/resipes.json');

    currentRecipes1 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
    print(currentRecipes1!.query);
    emit(LoadDataState());
  }
  Future<APIRecipeQuery> getRecipeData(String query, int from, int
  to) async {

    final recipeJson = await RecipeService.getRecipes(query,
        from, to);

    final recipeMap = json.decode(recipeJson);

    return APIRecipeQuery.fromJson(recipeMap);
  }

  sizeSelection(Size selectSize){
    if(selectSize==Size.High){
      size='high';
      highColor=Colors.black;
      mediumColor=Colors.grey.shade300;
      lowColor=Colors.grey.shade300;
    }
    if(selectSize==Size.Medume){
      size='medium';
      highColor=Colors.grey.shade300;
      mediumColor=Colors.black;
      lowColor=Colors.grey.shade300;
    }
    if(selectSize==Size.Low){
      size='low';
      highColor=Colors.grey.shade300;
      mediumColor=Colors.grey.shade300;
      lowColor=Colors.black;
    }
    emit(SelectColorState());
  }

    getSearch(String value)  async {
    searchLabel=[];
    //emit(LoadingState());
    currentRecipes1 = await getRecipeData(value, 0, 10);
    if(currentRecipes1!=null) {
      //searchLabel!.addAll(currentRecipes1!.hits[0].recipe.label);
      print(currentRecipes1!.hits![0].recipe.label);
      print("current re $currentRecipes1");
      /*currentRecipes1!.hits.forEach((element) {
        searchLabel!.addAll(element.recipe);
      });*/
    }

    print('search label is $searchLabel');
    emit(SearchSuccessState());


   // RecipeService.getData('https://api.edamam.com/search?app_id=3a03c3d6&app_key=e8e3caad81f614f4518ca1ab3eedb4f3&q=pasta&from=0&to=10');

    /*RecipeService.getData('https://developer.edamam.com/search').then((value) {
      print('value is ${value}');
      apiRecipeQuery =APIRecipeQuery.fromJson(value);
      apiRecipeQuery!.hits.forEach((element) {
        currentSearchList.addAll({
          element.recipe,

        });
        print('hhhhaaaa$search');
        emit(SearchSuccessState());

      });

      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });*/




  }


  List labelList=[];
  AddToBookMarkLabel(label){
    labelList.add(label);

  }
  List imageList=[];
  AddToBookMarkImage(image){
    imageList.add(image);
  }

  int x=1;
  double SliderValue=0;
  changeSlider(double value){
    SliderValue=value;
    emit(ChangeSliderState());
  }
  bool checkBox=false;
  changeCheckBox(value){
    checkBox=value;
    emit(ChangeCheckBoxState());
  }



  showTime(context)async{
    TimeOfDay? _pickedTime =await showTimePicker(
        initialEntryMode:TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(hour: timeOfDay.hour,
            minute: timeOfDay.minute));
    if (_pickedTime!=null){

       timeOfDay = _pickedTime;
       emit(ChangeTimeState());
    }
  }
  getDate(context)async{
    DateTime? _pickerDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (_pickerDate!=null){
       dueDate = _pickerDate;
       emit(ChangeDateState());
    }
  }


}
