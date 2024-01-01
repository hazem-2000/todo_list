import 'package:http/http.dart';

const String apiKey ='e8e3caad81f614f4518ca1ab3eedb4f3';
const String apiId = '3a03c3d6';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {

  static Future getData(String url) async {

    print('Calling url: $url');

    var response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('response connect');
      //print(response.body);
      return response.body;
    } else {

      print(response.statusCode);
    }
  }

  static Future<dynamic> getRecipes(String query, int from, int to) async
  {

    final recipeData = await getData(
        '$apiUrl?&q=$query&app_id=$apiId&app_key=$apiKey&from=$from&to=$to');
    // 3
    return recipeData;
  }
}