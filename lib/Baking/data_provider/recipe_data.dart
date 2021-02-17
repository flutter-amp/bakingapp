import 'dart:convert';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeDataProvider{
  final _baseUrl = 'http://192.168.43.122:8181';
  final http.Client httpClient;

  RecipeDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Recipe>> getRecipes()async{
    final response = await httpClient.get('$_baseUrl/recipes');
    print('satus coooooooooooooooooooooooooooooooooooooooooooooooooooo');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final recipes = jsonDecode(response.body) as List;
      return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed');
    }

  }

    Future<void> deleteRecipe(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/recipes/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete recipe.');
    }
  }

  
  Future<Recipe> createRecipe(Recipe recipe) async {  
    final response = await httpClient.post(
      Uri.http('192.168.43.122:8181', '/recipes/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'servings': recipe.servings,
        'duration': recipe.duration,
      }),
    );
     print("ppppppppppppppppppppppppppppppppppppppppppppppp");
    print(response.statusCode);
        print(response.body);

    if (response.statusCode == 201) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create recipe.');
    }
  }


Future<void> updateRecipe(Recipe recipe) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/recipes/update/${recipe.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': recipe.id,
        'title': recipe.title,
        'servings': recipe.servings,
        'duration': recipe.duration,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update recipe.');
    }
  }


}