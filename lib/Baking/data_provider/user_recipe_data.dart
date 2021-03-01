import 'dart:convert';
import 'dart:io';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserRecipeDataProvider{
  final _baseUrl = 'http://192.168.137.1:8181';
  final http.Client httpClient;

  UserRecipeDataProvider({@required this.httpClient}) : assert(httpClient != null);

  
  //   Future<List<Recipe>> getUserRecipes(int id)async{
  //   final response = await httpClient.get('$_baseUrl/user/$id/recipes');
  //   print('satus coooooooooooooooooooooooooooooooooooooooooooooooooooo');
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
       
  //     final recipes = jsonDecode(response.body) as List;
  //     return recipes.map((recipe) {
        
  //      return Recipe.fromJson(recipe);
  //     }).toList();
     
  //   } else {
  //     throw Exception('Failed');
  //   }

  // }
  //     Future<void> deleteRecipe(int id) async {
  //   final http.Response response = await httpClient.delete(
  //     '$_baseUrl/recipes/delete/$id',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode != 204) {
  //     throw Exception('Failed to delete recipe.');
  //   }
  // }
 


  }
  