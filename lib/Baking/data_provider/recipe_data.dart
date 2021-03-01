import 'dart:convert';
import 'dart:io';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';

class RecipeDataProvider{
  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;
  RecipeDataProvider({@required this.httpClient}) : assert(httpClient != null);


  Future<List<Recipe>> getRecipes()async{

    final response = await httpClient.get('$_baseUrl/recipes',
     headers: await SharedPrefUtils.getStringValuesSF().then((token){
         print(token);
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) 
    );
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
    print("my file"+recipe.image.toString());
    final response = await httpClient.post(

      Uri.http('192.168.1.9:8181', '/recipes/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'servings': recipe.servings,
        'duration': recipe.duration,
        // 'ingredients':recipe.ingredients,
        
      }),
    );
       print("shhhhhhhh");
     print("ppppppppppppppppppppppppppppppppppppppppppppppp");
    print(response.statusCode);
        print(response.body);
    await UploadImageRecipe(recipe.id,recipe.image);
    if (response.statusCode == 201) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create recipe.');
    }
    
  }

  Future<void> UploadImageRecipe(int recipeId,File file) async {  
    Dio dio= Dio();
    print("sure");
        print("file "+file.toString());
      String fileName = file.path.split('/').last;
     // print("file "+file.toString());
    FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(file.path, filename:fileName),
    });
    dio.options.headers["id"] = recipeId;
    
    var response = await dio.post("http://192.168.1.9:8181/recipes/newImage", data: formData,queryParameters:{"id":recipeId});
     //data.files({"file": new UploadFileInfo(file,basename(file.path))});
  //    print("ghg");
  //   var request = http.MultipartRequest('POST', Uri.parse('${_baseUrl}/newImage'));
  //       print("dhg");
        
  // request.files.add(await http.MultipartFile.fromPath('picture',file));
  // print("request added");
  // var response= await request.send().then((response) => print(response));
  //    print("ppppppppppppppppppppppppppppppppppppppppppppppp");
  //  //print(response.statusCode);
      

  //  // if (response.statusCode == 201) {
  //     //return Recipe.fromJson(jsonDecode(response.body));
  //     print("it's working");
  //   // } else {
  //   //   print("ddd");
  //   //   throw Exception('Failed to create recipe.');
  //   // }
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
    print("works");
    print("image "+response.statusCode.toString());
    if (response.statusCode != 204) {
      throw Exception('Failed to update recipe.');
    }
  }


}